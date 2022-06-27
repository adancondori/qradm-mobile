import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/api_service/model/sanction_api.dart';
import 'package:http/http.dart' as http;

class SanctionService {
  Future<List<Sanctions>?> getSanctions() async {
    var client = http.Client();

    var uri = Uri.parse('https://www.eventsadm.space/api/v1/mobile/sanctions');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json1 = json.decode(response.body);
      var sanctions = json1['payload'];
      return sanctionFromJson1(sanctions);
    }
  }
}


