import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_response.dart';
import 'api_route.dart';
import 'decodable.dart';

abstract class BaseAPIClient {

  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
  });

}
class APIClient implements BaseAPIClient {

  late final BaseOptions options;
  late Dio instance;
  APIClient(this.options) {
    instance = Dio(options);
  }

  @override
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data}) async {
    final config = route.getConfig();
    config.baseUrl = options.baseUrl;
    print(config.baseUrl);
    config.data = data;

    final response = await instance.fetch(config);
    final responseData = response.data;

    if (response.statusCode == 200) {
      return ResponseWrapper.init(create: create, json: responseData);
    }

    final errorResponse = ErrorResponse.fromJson(data);

    throw errorResponse;
  }
}