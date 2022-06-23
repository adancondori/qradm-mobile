part of 'qr_bloc.dart';

@immutable
abstract class QrState {}

class QrInitial extends QrState {}

class Loading extends QrState {
  @override
  List<Object?> get props => [];
}

class Request extends QrState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends QrState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}

class RedirectGroup extends QrState {
  final Group group;
  RedirectGroup(this.group);

  @override
  List<Object?> get props => [];
}
