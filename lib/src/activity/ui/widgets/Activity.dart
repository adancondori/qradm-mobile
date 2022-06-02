import 'decodable.dart';

class Activity implements Decodable<Activity> {

  late int id;
  late String name;
  late String detail;

  Activity({required this.id, required this.name, required this.detail});

  @override
  Activity decode(dynamic data) {
    id = data['id'];
    name = data['employee_name'] ?? '';
    detail = data['employee_salary'] ?? 0;
    return this;
  }

}