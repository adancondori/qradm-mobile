import 'package:equatable/equatable.dart';
import 'package:qradm/src/event/model/evento.dart';
import 'package:qradm/src/service/decodable.dart';

class User implements Decodable<User>, Equatable {
  late int id;
  late String name;
  late String last_name;
  late String type_role;
  late String phone;
  late int event_id;
  late bool state;
  late String code;
  late String email;
  late String app_token;
  Evento? event;

  @override
  User decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    last_name = data['last_name'] ?? '';
    type_role = data['type_role'] ?? '';
    phone = data['phone'] ?? '';
    event_id = data['event_id'] ?? 0;
    state = data['state'] ?? true;
    code = data['code'] ?? '';
    email = data['email'] ?? '';
    app_token = data['app_token'] ?? "";
    if (data['event'] != null) {
      event = Evento().decode(data['event']);
    } else {
      event = null;
    }
    return this;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        last_name,
        type_role,
        phone,
        event_id,
        state,
        code,
        email,
        event
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}
