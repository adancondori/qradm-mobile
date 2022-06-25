import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/extra_point/model/request_extrapoint.dart';
import 'package:qradm/src/login/model/user.dart';
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
          final result =
              await authRepository.sendGroupACEPSA(event.reuest_group);
          if (result.type == AppConstants.RESPONSE_SUCCESSFULLY) {
            emit(RedirectBack());
          } else {
            emit(AuthErrorAll(result.msg));
          }
        } catch (e) {
          emit(AuthErrorAll(e.toString()));
        }
      },
    );
  }
}
