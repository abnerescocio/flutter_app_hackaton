import '../models/user.dart';

abstract class UserEvent {
  final String userId;

  UserEvent(this.userId);
}

class GetUserEvent extends UserEvent {
  GetUserEvent(super.userId);
}

class SetUserEvent extends UserEvent {
  final User user;

  SetUserEvent(super.userId, this.user);
}
