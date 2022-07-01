import 'package:qradm/src/service/decodable.dart';

class GuestDetail implements Decodable<GuestDetail> {
  late int id;
  late String name;
  late String code;
  late bool state;
  late String description;
  late String total_activity;
  late String total_sanction;
  late String total_extra_point;
  late String sum_total;

  GuestDetail();

  @override
  GuestDetail decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    code = data['code'] ?? '';
    state = data['state'] ?? true;
    description = data['description'] ?? '';
    total_activity = data['total_activity'] ?? '';
    total_sanction = data['total_sanction'] ?? '';
    total_extra_point = data['total_extra_point'] ?? '';
    sum_total = data['sum_total'] ?? '';
    return this;
  }
}
