import 'package:qradm/src/service/decodable.dart';

class QRScan implements Decodable<QRScan> {

  late int id;
  late String name;
  late String code;
  late bool state;
  late String description;
  //late int event_id;

  QRScan();

  @override
  QRScan decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    code = data['code'] ?? '';
    state = data['state'] ?? 0;
    description = data['description'] ?? '';
    //event_id = data['event_id'] ?? 0;
    return this;
  }
}