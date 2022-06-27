import 'dart:convert';

import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/service/decodable.dart';

class RequestGroup {
  String? codeGroup;
  int? id;
  int? value;
  String? observation;
  User user;

  RequestGroup(
    this.codeGroup,
    this.id,
    this.value,
    this.observation,
    this.user,
  );

  String encode() {
    String body = jsonEncode(<String, dynamic>{
      'code_group': codeGroup,
      'extrapoint_id': id,
      'value': value,
      'observation': observation
    });
    return body;
  }
}
