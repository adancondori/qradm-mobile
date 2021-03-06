import 'package:dio/dio.dart';
import 'package:qradm/src/activity/model/Activity.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/detail_group/model/group.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/model/request_extrapoint.dart';
import 'package:qradm/src/extra_point/model/response_acepsa.dart';
import 'package:qradm/src/guest/model/guest.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/sanction/model/sanction_api.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';

class AuthRepository {
  final APIClient client = APIClient(
      options: BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    baseUrl: AppConstants.BASE_URL,
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

  Future<ResponseAcEPSa> sendGroupAllType(
    RequestGroup requestGroup,
    String route_api,
  ) async {
    // Perform GET request to the endpoint "/users/<id>"
    final Dio _dio = Dio();
    Map<String, dynamic> headers = {'CODE': requestGroup.user.email};
    _dio.options = BaseOptions(headers: headers);

    ResponseAcEPSa responseAcEPSa = ResponseAcEPSa();
    try {
      Response request = await _dio.post(
        AppConstants.BASE_URL + route_api,
        data: {
          "code_group": requestGroup.codeGroup,
          "id": requestGroup.id,
          "value": requestGroup.value,
          "observation": requestGroup.observation,
        },
      );
      print('User Info: ${request.data}');

      responseAcEPSa.decode(request.data);
      // user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return responseAcEPSa;
  }

  Future<APIResponse> getGroupDetail(String codeGroup) async {
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];

    client.instance.interceptors.addAll(interceptors);
    final result = await client.request<APIResponse<GuestDetail>>(
      route:
          APIRoute(APIType.api_group_details, routeParams: "code=$codeGroup"),
      create: () => APIResponse(create: () => GuestDetail()),
    );
    return result.payload;
  }

  Future<APIListResponse> getMyActivities(String codeGroup) async {
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
    final result = await client.request<APIListResponse<ApiActivitys>>(
        route: APIRoute(
          APIType.api_my_activities,
          routeParams: "code_group=$codeGroup",
        ),
        create: () => APIListResponse(create: () => ApiActivitys()));
    return result.payload;
  }

  Future<APIListResponse> getMyExtraPoints(String codeGroup) async {
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
    final result = await client.request<APIListResponse<ExtraPoint>>(
        route: APIRoute(
          APIType.api_my_extrapoints,
          routeParams: "code_group=$codeGroup",
        ),
        create: () => APIListResponse(create: () => ExtraPoint()));

    return result.payload;
  }

  Future<APIListResponse> getMySanctions(String codeGroup) async {
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);

    final result = await client.request<APIListResponse<Sanctions>>(
        route: APIRoute(
          APIType.api_my_sanctions,
          routeParams: "code_group=$codeGroup",
        ),
        create: () => APIListResponse(create: () => Sanctions(1, "", "", 0.0)));

    return result.payload;
  }
}
