import '../models/user.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final String userId;

  GetUserEvent(this.userId);
}

class AddUserEvent extends UserEvent {
  final User user;
  final String userId;

  AddUserEvent(this.user, this.userId);
}
