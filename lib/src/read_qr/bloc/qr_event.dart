part of 'qr_bloc.dart';

@immutable
abstract class QrEvent {}

class RequestAPI extends QrEvent {
  final String code_group;
  // final String password;

  RequestAPI(this.code_group);
}
