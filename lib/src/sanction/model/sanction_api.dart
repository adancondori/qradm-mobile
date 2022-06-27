import 'dart:convert';
import 'package:qradm/src/model_generic/group_action.dart';

List<Sanctions> sanctionFromJson1(List list) =>
    List<Sanctions>.from(list.map((x) => Sanctions.fromJson(x)));

String sanctionsToJson(List<Sanctions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sanctions extends GroupAction {
  Sanctions({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
  });

  int id;
  String name;
  String description;
  double amount;

  factory Sanctions.fromJson(Map<String, dynamic> json) => Sanctions(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        amount: double.parse(json['amount']),
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
}
