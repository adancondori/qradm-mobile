part of 'guest_detail_bloc.dart';

@immutable
abstract class GuestDetailEvent {}

class RequestAPIGD extends GuestDetailEvent {
  User user;
  RequestAPIGD(this.user);
}
