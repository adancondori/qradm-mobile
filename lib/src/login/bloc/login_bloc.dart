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
    on<SignInRequested>((event, emit) async {
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
    });
  }
  //
  // // @override
  // // Stream<LoginInitial> mapEventToState(LoginEvent login) async* {
  // //   if (login is LoginAPIRequest) {
  // //     callAPILogin(login.username);
  // //   }
  // // }
  //
  // void callAPILogin(String user_name) {
  //   Map<String, dynamic> headers = {'CODE': user_name};
  //   client = APIClient( options:
  //   BaseOptions(
  //     connectTimeout: 10000,
  //     receiveTimeout: 10000,
  //     baseUrl: 'http://192.168.1.116:3200/api/v1/mobile',
  //     headers: headers,
  //   )
  //   );
  //   final interceptors = [
  //     AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
  //     APILogInterceptor(),
  //   ];
  //   client.instance.interceptors.addAll(interceptors);
  //   onConectionServer();
  // }
  //
  // Future<APIResponse> fetchLogin() async {
  //   final result = await client.request<APIResponse<User>>(
  //       route: APIRoute(APIType.api_login_user, routeParams: ''),
  //       create: () => APIResponse(create: () => User())
  //   );
  //   return result.payload;
  // }
  // void onConectionServer() async {
  //   final result = await fetchLogin();
  //   if (result.type=="SUCCESSFULLY") {
  //     final user = result.payload;
  //   } else {
  //
  //   }
  // }
}
