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
