import 'package:equatable/equatable.dart';
import 'package:qradm/src/service/decodable.dart';

class RequestError implements Decodable<RequestError>, Equatable {

  late String type;
  late String msg;
  // late String payload;

  @override
  RequestError decode(dynamic data) {
    type = data['type'] ?? '';
    msg = data['msg'] ?? '';
    return this;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    type,
    msg,
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => false;

}