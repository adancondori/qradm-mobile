part of 'bloc_list_bloc.dart';

@immutable
abstract class GuestListEvent {}

class RequestGuestListEvent extends GuestListEvent {
  final User user;
  RequestGuestListEvent({required this.user});
}
