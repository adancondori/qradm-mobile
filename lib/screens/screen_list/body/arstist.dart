
import 'package:qradm/src/service/decodable.dart';

class Artist implements Decodable<Artist> {

  late int id;
  late String name;
  late String detail;
  late String url_path;

  Artist({required this.id, required this.name, required this.detail, required this.url_path});

  @override
  Artist decode(dynamic data) {
    id = data['id'];
    name = data['employee_name'] ?? '';
    detail = data['employee_salary'] ?? 0;
    url_path = data['profile_image'] ?? '';
    return this;
  }

}