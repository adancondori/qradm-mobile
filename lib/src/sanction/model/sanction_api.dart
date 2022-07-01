import 'dart:convert';
import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/model_generic/relation_group.dart';
import 'package:qradm/src/service/decodable.dart';

List<Sanctions> sanctionFromJson1(List list) =>
    List<Sanctions>.from(list.map((x) => Sanctions.fromJson(x)));

String sanctionsToJson(List<Sanctions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sanctions extends GroupAction implements Decodable<Sanctions> {
  late int id;
  late String name;
  late String description;
  late double amount;
  late RelationGroup? my_sanction;

  Sanctions(this.id, this.name, this.description, this.amount);

  factory Sanctions.fromJson(Map<String, dynamic> json) => Sanctions(
        json["id"] ?? 0,
        json["name"] ?? "",
        json["description"] ?? "",
        double.parse(json['amount']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount.toString(),
      };

  @override
  double getAmount() {
    return amount;
  }

  @override
  int getId() {
    return id;
  }

  @override
  String getName() {
    return name;
  }

  @override
  Sanctions decode(data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? '';
    description = data['description'] ?? '';
    amount = double.parse(data['amount']);
    var model = RelationGroup();
    my_sanction =
        data['my_sanction'] != null ? model.decode(data['my_sanction']) : null;
    return this;
  }

  @override
  bool existMyAction() {
    return my_sanction != null;
  }

  @override
  double getMyAmount() {
    double aux = my_sanction != null ? my_sanction!.amount : 0.0;
    return aux;
  }

  @override
  String getDescription() {
    return description;
  }
}
