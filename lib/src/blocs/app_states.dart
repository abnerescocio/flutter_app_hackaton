import '../models/user.dart';

// GET USER STATE
abstract class GetUserState {}

class InitialGetUserState extends GetUserState {}

class SuccessGetUserState extends GetUserState {
  final User user;

  SuccessGetUserState(this.user);
}

class ErrorGetUserState extends GetUserState {
  final Object exception;

  ErrorGetUserState(this.exception);
}

// SET USER STATE
abstract class SetUserState {}

class InitialSetUserState extends SetUserState {}

class SuccessSetUserState extends SetUserState {}

class ErrorSetUserState extends SetUserState {
  final Object exception;

  ErrorSetUserState(this.exception);
}

// SET USER TRAINING STATE
abstract class SetUserTrainingState {}

class InitialSetUserTrainingState extends SetUserTrainingState {}

class SuccessSetUserTrainingState extends SetUserTrainingState {}

class ErrorSetUserTrainingState extends SetUserTrainingState {
  final Object exception;

  ErrorSetUserTrainingState(this.exception);
}
