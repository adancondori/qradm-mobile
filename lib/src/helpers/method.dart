import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/model_generic/group_action.dart';

class AppConstants {
  static String getType(GroupAction groupAction) {
    if (groupAction is ExtraPoint) {
    } else if (groupAction is ApiActivitys) {
    } else if (groupAction is ExtraPoint) {}
    return "";
  }
}
