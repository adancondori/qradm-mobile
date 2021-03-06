import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qradm/src/service/model/request_error.dart';
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
  APIClient({required this.options}) {
    instance = Dio(options);
  }

  @override
  Future<ResponseWrapper<T>> request<T extends Decodable>(
      {required APIRouteConfigurable route,
      required Create<T> create,
      dynamic data}) async {
    final config = route.getConfig();
    config.baseUrl = options.baseUrl;
    config.headers = options.headers;
    config.data = data;
    print("----- APIClient request ---");
    print(config.baseUrl);
    print(config.headers);
    print(config.data);

    final response = await instance.fetch(config);
    final responseData = response.data;

    if (response.statusCode == 200) {
      return ResponseWrapper.init(create: create, json: responseData);
    } else {
      return ResponseWrapper.init(create: create, json: responseData);
    }

    final errorResponse = ErrorResponse(create: data);

    throw errorResponse;
  }
}
