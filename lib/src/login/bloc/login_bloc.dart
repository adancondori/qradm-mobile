import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>(
      (event, emit) async {
        emit(Loading());
        try {
          final result = await authRepository.signIn(event.username);
          if (result.type == AppConstants.RESPONSE_SUCCESSFULLY) {
            emit(Authenticated(result.payload));
          } else {
            emit(AuthError(result.msg));
          }
        } catch (e) {
          emit(AuthError(e.toString()));
          emit(UnAuthenticated());
        }
      },
    );
  }
}
