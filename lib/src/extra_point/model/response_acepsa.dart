import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/decodable.dart';

class ResponseAcEPSa implements Decodable<ResponseAcEPSa> {
  late String type;
  late String msg;

  @override
  ResponseAcEPSa decode(dynamic data) {
    type = data['type'] ?? '';
    if (type != AppConstants.RESPONSE_SUCCESSFULLY) {
      msg = data['msg'] ?? '';
    }
    return this;
  }
}
