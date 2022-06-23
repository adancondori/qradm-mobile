import 'package:dio/dio.dart';
import 'package:qradm/src/detail_group/model/group.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';

class AuthRepository {
  final APIClient client = APIClient(
      options: BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    baseUrl: 'http://192.168.1.116:3200/api/v1/mobile',
    // headers: headers,
  ));

  Future<APIResponse> signIn(String user_name) async {
    Map<String, dynamic> headers = {'CODE': user_name};
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
    client.instance.options.headers.addAll(headers);
    final result = await client.request<APIResponse<User>>(
      route: APIRoute(APIType.api_login_user, routeParams: ''),
      create: () => APIResponse(create: () => User()),
    );
    return result.payload;
  }

  Future<APIResponse> ScanCode(String code_grup) async {
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
    final result = await client.request<APIResponse<Group>>(
      route: APIRoute(APIType.api_scan_group, routeParams: "code=${code_grup}"),
      create: () => APIResponse(create: () => Group()),
    );
    return result.payload;
  }
}
