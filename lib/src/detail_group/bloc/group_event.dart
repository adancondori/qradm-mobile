part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class RequestAPI extends GroupEvent {
  final RequestGroup request_group;
  final GroupAction groupAction;
  RequestAPI(this.request_group, this.groupAction);
}
