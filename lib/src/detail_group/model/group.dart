import 'package:qradm/src/service/decodable.dart';

class Group implements Decodable<Group> {
  late int id;
  late String name;
  late String code;
  late bool state;
  late String description;

  Group();

  @override
  Group decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    description = data['description'] ?? '';
    state = data['state'] ?? true;
    code = data['code'] ?? '';
    return this;
  }
}
