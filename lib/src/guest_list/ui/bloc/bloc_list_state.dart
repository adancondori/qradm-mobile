part of 'bloc_list_bloc.dart';

@immutable
abstract class GuestListState {}

class GuestListInitial extends GuestListState {}

class LoadingGuestList extends GuestListState {
  @override
  List<Object?> get props => [];
}

class RequestGuestListAPI extends GuestListState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthErrorGuestList extends GuestListState {
  final String error;

  AuthErrorGuestList(this.error);
  @override
  List<Object?> get props => [error];
}

class RedirectBackGuestList extends GuestListState {
  RedirectBackGuestList();
  @override
  List<Object?> get props => [];
}

class LoadedGuestList extends GuestListState {
  List<ApiActivitys> apiActivitys = [];
  List<ExtraPoint> extraPoints = [];
  List<Sanctions> sanctions = [];

  LoadedGuestList(this.apiActivitys, this.extraPoints, this.sanctions);
  @override
  List<Object?> get props => [];
}
