import 'package:qradm/src/service/decodable.dart';

class User implements Decodable<User> {

  late int id;
  late String name;
  late String last_name;
  late String type_role;
  late String phone;
  late int event_id;
  late bool state;
  late String code;
  late String email;
  late String event;

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
    event = data['event'] ?? '';
    return this;
  }

}