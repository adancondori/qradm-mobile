import 'package:equatable/equatable.dart';
import 'package:qradm/src/service/decodable.dart';

class Evento implements Decodable<Evento>, Equatable {

  late int id;
  late String name;
  late String description;
  late String code;
  late int type_validation;

  @override
  Evento decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    description = data['description'] ?? '';
    code = data['code'] ?? '';
    type_validation = data['type_validation'] ?? 0;
    return this;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    description,
    type_validation,
    code,
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => false;

}