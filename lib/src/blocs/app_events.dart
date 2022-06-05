import 'package:flutter_app_hackaton/src/models/training.dart';

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

class SetUserTrainingEvent extends UserEvent {
  final Training training;

  SetUserTrainingEvent(super.userId, this.training);
}

class GetUserTrainingListEvent extends UserEvent {
  GetUserTrainingListEvent(super.userId);
}
