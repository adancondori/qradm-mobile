import 'decodable.dart';

///A function that creates an object of type [T]

typedef Create<T> = T Function();

///Construct to get object from generic class

abstract class GenericObject<T> {

  Create<Decodable> create;

  GenericObject({ required this.create });

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

  ResponseWrapper({ required Create<Decodable> create, error})

  : super(create: create);

  factory ResponseWrapper.init({ 
    required Create<Decodable> create,
    Map<String, dynamic>? json })
  {
    final wrapper = ResponseWrapper<T>(create: create, error: null);
    wrapper.payload = wrapper.genericObject(json);
    return wrapper;
  }
  
}

class APIResponse<T> extends GenericObject<T> 
  implements Decodable<APIResponse<T>> {

  late T payload;
  late String type;

  APIResponse({ required Create<Decodable> create }) : super(create: create);

  @override
  APIResponse<T> decode(dynamic json) {
    type = json['type'];
    payload = genericObject(json['payload']);
    return this;
  }

}

class APIListResponse<T> extends GenericObject<T> 
  implements Decodable<APIListResponse<T>> {
  
  late String status;
  late List<T> data;

  APIListResponse({ required Create<Decodable> create }) : super(create: create);

  @override
  APIListResponse<T> decode(dynamic json) {
    status = json['status'];
    data = [];
    json['data'].forEach((item) {
      print("----------------");
      print(item);
      print("----------------");
      data.add(genericObject(item));
    });
    return this;
  }

}

class ErrorResponse implements Exception {
  late String message;
  ErrorResponse({ required this.message });
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(message: json['message']);
  }

  @override
  String toString() {
    return message;
  }
}

class TypeResponse implements Exception {
  late String type;
  TypeResponse({ required this.type });
  factory TypeResponse.fromJson(Map<String, dynamic> json) {
    return TypeResponse(type: json['type']);
  }

  @override
  String toString() {
    return type;
  }
}