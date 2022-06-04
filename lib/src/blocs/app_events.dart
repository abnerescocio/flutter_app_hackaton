import '../models/user.dart';

abstract class UserEvent {
  final String userId;

  UserEvent(this.userId);
}

class GetUserEvent extends UserEvent {
  GetUserEvent(super.userId);
}

class SetUserIsFirstAccessEvent extends UserEvent {
  final bool isFirstAccess;

  SetUserIsFirstAccessEvent(super.userId, this.isFirstAccess);
}

class AddUserEvent extends UserEvent {
  final User user;

  AddUserEvent(super.userId, this.user);
}
