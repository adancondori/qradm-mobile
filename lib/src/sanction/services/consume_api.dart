import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qradm/src/sanction/model/sanction_api.dart';
import 'package:qradm/src/service/app_constant.dart';

class SanctionService {
  Future<List<Sanctions>?> getSanctions() async {
    var client = http.Client();

    var uri = Uri.parse(AppConstants.BASE_URL + '/sanctions');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json1 = json.decode(response.body);
      var sanctions = json1['payload'];
      return sanctionFromJson1(sanctions);
    }
  }
}
