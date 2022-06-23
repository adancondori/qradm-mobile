import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qradm/src/detail_group/model/group.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/auth_repository.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final AuthRepository authRepository;

  QrBloc({required this.authRepository}) : super(QrInitial()) {
    on<RequestAPI>((event, emit) async {
      emit(Loading());
      try {
        final result = await authRepository.ScanCode(event.code_group);
        if (result.type == AppConstants.RESPONSE_SUCCESSFULLY) {
          emit(RedirectGroup(result.payload));
        } else {
          emit(AuthError(result.msg));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
