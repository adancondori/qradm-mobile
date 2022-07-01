import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/model_generic/relation_group.dart';
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
  late RelationGroup? my_extrapoint;

  ExtraPoint();

  @override
  ExtraPoint decode(dynamic data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    description = data['description'] ?? '';
    code = data['code'] ?? '';
    amount = double.parse(data['amount']);
    event_id = data['event_id'] ?? 0;
    var model = RelationGroup();
    my_extrapoint = data['my_extrapoint'] != null
        ? model.decode(data['my_extrapoint'])
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

  @override
  bool existMyAction() {
    return my_extrapoint != null;
  }

  @override
  double getMyAmount() {
    double aux = my_extrapoint != null ? my_extrapoint!.amount : 0.0;
    return aux;
  }

  @override
  String getDescription() {
    return description;
  }
}
