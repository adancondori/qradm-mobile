import 'dart:convert';
import 'package:flutter/material.dart';

List<Sanctions> sanctionFromJson1(List list) => List<Sanctions>.from(list.map((x) => Sanctions.fromJson(x)));

String sanctionsToJson(List<Sanctions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sanctions {
  Sanctions({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Sanctions.fromJson(Map<String, dynamic> json) => Sanctions(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    description: json["description"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
