import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/service/app_constant.dart';

import 'decodable.dart';

///A function that creates an object of type [T]

typedef Create<T> = T Function();

///Construct to get object from generic class

abstract class GenericObject<T> {
  Create<Decodable> create;

  GenericObject({required this.create});

  T genericObject(dynamic data) {
    final item = create();
    return item.decode(data);
  }
}

///Construct to wrap response from API.
///
///Used it as return object of APIController to handle any kind of response.

class ResponseWrapper<T> extends GenericObject<T> {
  late T payload;
  late TypeResponse type;
  // late ErrorResponse error;

  ResponseWrapper({required Create<Decodable> create, error})
      : super(create: create);

  factory ResponseWrapper.init(
      {required Create<Decodable> create, Map<String, dynamic>? json}) {
    final wrapper = ResponseWrapper<T>(create: create, error: null);
    wrapper.payload = wrapper.genericObject(json);
    return wrapper;
  }
}

class ResponseErrorWrapper<T> extends ResponseWrapper<T> {
  // late T payload;
  // late TypeResponse type;
  // late MsgResponse msg;

  ResponseErrorWrapper({required Create<Decodable> create, msg})
      : super(create: create);

  factory ResponseErrorWrapper.initError(
      {required Create<Decodable> create, Map<String, dynamic>? json}) {
    final wrapper = ResponseErrorWrapper<T>(create: create, msg: null);
    wrapper.payload = wrapper.genericObject(json);
    return wrapper;
  }
}

class APIResponse<T> extends GenericObject<T>
    implements Decodable<APIResponse<T>> {
  late T payload;
  late String type;
  late String msg;

  APIResponse({required Create<Decodable> create}) : super(create: create);

  @override
  APIResponse<T> decode(dynamic json) {
    type = json['type'];
    if (type == AppConstants.RESPONSE_SUCCESSFULLY) {
      payload = genericObject(json['payload']);
    } else {
      msg = json['msg'];
      payload = User() as T;
    }

    return this;
  }
}

class APIListResponse<T> extends GenericObject<T>
    implements Decodable<APIListResponse<T>> {
  late String type;
  late List<T> payload;
  late String msg;

  APIListResponse({required Create<Decodable> create}) : super(create: create);

  @override
  APIListResponse<T> decode(dynamic json) {
    type = json['type'];
    payload = [];
    json['payload'].forEach((item) {
      print("----------------");
      print(item);
      print("----------------");
      payload.add(genericObject(item));
    });
    return this;
  }
}

class ErrorResponse<T> extends GenericObject<T>
    implements Decodable<ErrorResponse<T>> {
  late String type;
  late String msg;
  late T payload;

  ErrorResponse({required Create<Decodable> create}) : super(create: create);

  @override
  ErrorResponse<T> decode(dynamic json) {
    type = json['type'];
    payload = "" as T;
    msg = json['msg'] ?? '';
    return this;
  }
}

class TypeResponse implements Exception {
  late String type;
  TypeResponse({required this.type});
  factory TypeResponse.fromJson(Map<String, dynamic> json) {
    return TypeResponse(type: json['type']);
  }

  @override
  String toString() {
    return type;
  }
}

class MsgResponse implements Exception {
  late String msg;
  MsgResponse({required this.msg});
  factory MsgResponse.fromJson(Map<String, dynamic> json) {
    return MsgResponse(msg: json['msg']);
  }

  @override
  String toString() {
    return msg;
  }
}
