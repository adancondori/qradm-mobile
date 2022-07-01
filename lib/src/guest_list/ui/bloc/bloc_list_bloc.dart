import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/activity/model/Activity.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/read_qr/bloc/qr_bloc.dart';
import 'package:qradm/src/sanction/model/sanction_api.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/auth_repository.dart';

part 'bloc_list_event.dart';
part 'bloc_list_state.dart';

class ListGuestBloc extends Bloc<GuestListEvent, GuestListState> {
  final AuthRepository authRepository;

  ListGuestBloc({required this.authRepository}) : super(GuestListInitial()) {
    on<RequestGuestListEvent>(
      (event, emit) async {
        emit(LoadingGuestList());

        try {
          final resultActivity =
              await authRepository.getMyActivities(event.user.app_token);
          final resultExtrapoint =
              await authRepository.getMyExtraPoints(event.user.app_token);
          final resultSanctions =
              await authRepository.getMySanctions(event.user.app_token);

          if (resultActivity.type == AppConstants.RESPONSE_SUCCESSFULLY) {
            emit(LoadedGuestList(
              resultActivity.payload as List<ApiActivitys>,
              resultExtrapoint.payload as List<ExtraPoint>,
              resultSanctions.payload as List<Sanctions>,
            ));
          } else {
            emit(AuthErrorGuestList(resultActivity.msg));
          }
        } catch (e) {
          emit(AuthErrorGuestList(e.toString()));
          // emit(UnAuthenticated());
        }
      },
    );
  }
}
