import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/service/decodable.dart';

class ExtraPoint extends GroupAction implements Decodable<ExtraPoint> {
  late int id;
  late String name;
  late String description;
  // late String rules;
  late String code;
  // late String date_init;
  // late String date_end;
  late double amount;
  // late int is_closed;
  // late int state;
  // late int is_visible;
  late int event_id;
  late ExtraPoint? my_extrapoint;

  ExtraPoint();

  @override
  ExtraPoint decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    description = data['description'] ?? '';
    // rules = data['rules'] ?? '';
    code = data['code'] ?? '';
    // date_init = data['date_init'] ?? '';
    // date_end = data['date_end'] ?? '';
    amount = double.parse(data['amount']);
    // is_closed = data['is_closed'] ?? 0;
    // state = data['state'] ?? 0;
    // is_visible = data['is_visible'] ?? 0;
    event_id = data['event_id'] ?? 0;
    var extrapoint = ExtraPoint();
    my_extrapoint = data['my_extrapoint'] != null
        ? extrapoint.decode(data['my_extrapoint'])
        : null;
    return this;
  }

  @override
  getName() {
    return name;
  }

  @override
  double getAmount() {
    return amount;
  }

  @override
  int getId() {
    return id;
  }
}
