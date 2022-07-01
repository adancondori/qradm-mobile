import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/guest/model/guest.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/auth_repository.dart';

part 'guest_detail_event.dart';
part 'guest_detail_state.dart';

class GuestDetailBloc extends Bloc<GuestDetailEvent, GuestDetailState> {
  final AuthRepository authRepository;
  GuestDetailBloc({required this.authRepository})
      : super(GuestDetailInitial()) {
    on<RequestAPIGD>((event, emit) async {
      emit(LoadingGuestDetail());
      try {
        final result =
            await authRepository.getGroupDetail(event.user.app_token);

        if (result.type == AppConstants.RESPONSE_SUCCESSFULLY) {
          emit(RedirectBackGuestDetail(guestDetail: result.payload));
        } else {
          emit(AuthErrorGuestDetail(result.msg));
        }
      } catch (e) {
        emit(AuthErrorGuestDetail(e.toString()));
      }
    });
  }
}
