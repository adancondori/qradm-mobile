import 'package:dio/dio.dart';

enum APIType {
  api_login_user,
  api_extrapoint,
  api_scan_group,
  api_group_extrapoint,
  api_activity,
  listEmployees,
  detailsEmployee,
  refreshToken,
  sanciones
}

class APIRoute implements APIRouteConfigurable {
  final APIType type;
  final String routeParams;

  APIRoute(this.type, {required this.routeParams});

  /// Return config of api (method, url, header)
  @override
  RequestOptions getConfig() {
    // pass extra value to detect public or auth api
    const noAuth = {'no_auth': true};
    switch (type) {
      //login
      case APIType.api_login_user:
        return RequestOptions(
            path: '/log_in', method: APIMethod.post, extra: noAuth);
      case APIType.api_extrapoint:
        return RequestOptions(
            path: '/extrapoints', method: APIMethod.get, extra: noAuth);
      case APIType.api_scan_group:
        return RequestOptions(
            path: '/group_qrscan?$routeParams',
            method: APIMethod.get,
            extra: noAuth);
      case APIType.api_activity:
        return RequestOptions(
            path: '/activities',
            method: APIMethod.get,
            extra: noAuth
        );
      case APIType.api_group_extrapoint:
        return RequestOptions(
            path: '/save_group_extrapoint',
            method: APIMethod.post,
            extra: noAuth);

      case APIType.listEmployees:
        return RequestOptions(
            path: '/employees', method: APIMethod.get, extra: noAuth);

      case APIType.detailsEmployee:
        return RequestOptions(
          path: '/employees/$routeParams',
          method: APIMethod.get,
        );

      case APIType.sanciones:
        return RequestOptions(
          path: '/sanciones/$routeParams',
          method: APIMethod.post,
        );
      default:
        return RequestOptions(
            path: '/employees', method: APIMethod.get, extra: noAuth);
    }
  }
}

// ignore: one_member_abstracts
abstract class APIRouteConfigurable {
  RequestOptions getConfig();
}

class APIMethod {
  static const get = 'get';
  static const post = 'post';
  static const put = 'put';
  static const patch = 'patch';
  static const delete = 'delete';
}
