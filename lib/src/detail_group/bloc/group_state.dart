part of 'group_bloc.dart';

@immutable
abstract class GroupState {}

class GroupInitialAll extends GroupState {}

class LoadingAll extends GroupState {
  @override
  List<Object?> get props => [];
}

class RequestAll extends GroupState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthErrorAll extends GroupState {
  final String error;

  AuthErrorAll(this.error);
  @override
  List<Object?> get props => [error];
}

class RedirectBack extends GroupState {
  RedirectBack();
  @override
  List<Object?> get props => [];
}
