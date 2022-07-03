import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/model/request_extrapoint.dart';
import 'package:qradm/src/extra_point/model/response_acepsa.dart';
import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/sanction/model/sanction_api.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/auth_repository.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final AuthRepository authRepository;

  GroupBloc({required this.authRepository}) : super(GroupInitialAll()) {
    on<RequestAPI>(
      (event, emit) async {
        emit(LoadingAll());
        try {
          ResponseAcEPSa? result;
          if (event.groupAction is ExtraPoint) {
            final result1 = await authRepository.sendGroupAllType(
              event.request_group,
              '/save_group_extrapoint',
            );
            result = result1;
          } else if (event.groupAction is ApiActivitys) {
            final result1 = await authRepository.sendGroupAllType(
              event.request_group,
              '/save_group_activity',
            );
            result = result1;
          } else if (event.groupAction is Sanctions) {
            final result1 = await authRepository.sendGroupAllType(
              event.request_group,
              '/save_group_sanction',
            );
            result = result1;
          }

          if (result?.type == AppConstants.RESPONSE_SUCCESSFULLY) {
            emit(RedirectBack());
          } else {
            emit(AuthErrorAll(result!.msg));
          }
        } catch (e) {
          emit(AuthErrorAll(e.toString()));
        }
      },
    );
  }
}
