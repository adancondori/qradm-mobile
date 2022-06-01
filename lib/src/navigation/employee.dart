import 'package:qradm/src/service/decodable.dart';

class Employee implements Decodable<Employee> {

  late int id;
  late String name;
  late int salary;
  late int age;
  late String profileImage;

  @override
  Employee decode(dynamic data) {
    id = data['id'];
    name = data['employee_name'] ?? '';
    salary = data['employee_salary'] ?? 0;
    age = data['employee_age'] ?? 0;
    profileImage = data['profile_image'] ?? '';
    return this;
  }

}