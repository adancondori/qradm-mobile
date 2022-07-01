import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/service/decodable.dart';

class RelationGroup implements Decodable<RelationGroup> {
  late int id;
  late double amount;
  late int group_id;
  // late int model_id;
  late String observation;
  late int user_id;
  late String name;

  RelationGroup();

  @override
  RelationGroup decode(dynamic data) {
    id = data['id'] ?? 0;
    amount = double.parse(data['amount']);
    group_id = data['group_id'] ?? 0;
    // model_id = data['sanction_id'] ?? 0;
    observation = data['observation'] ?? '';
    user_id = data['user_id'] ?? 0;
    name = data['name'] ?? '';
    return this;
  }
}
