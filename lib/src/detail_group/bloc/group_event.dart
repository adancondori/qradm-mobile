part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class RequestAPI extends GroupEvent {
  final RequestGroup reuest_group;
  RequestAPI(this.reuest_group);
}
