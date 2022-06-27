import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qradm/src/sanction/model/sanction_api.dart';

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


