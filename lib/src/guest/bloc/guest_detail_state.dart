part of 'guest_detail_bloc.dart';

@immutable
abstract class GuestDetailState {}

class GuestDetailInitial extends GuestDetailState {}

class LoadingGuestDetail extends GuestDetailState {
  @override
  List<Object?> get props => [];
}

class RequestGuestDetail extends GuestDetailState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthErrorGuestDetail extends GuestDetailState {
  final String error;

  AuthErrorGuestDetail(this.error);
  @override
  List<Object?> get props => [error];
}

class RedirectBackGuestDetail extends GuestDetailState {
  final GuestDetail guestDetail;
  RedirectBackGuestDetail({required this.guestDetail});
  @override
  List<Object?> get props => [guestDetail];
}
