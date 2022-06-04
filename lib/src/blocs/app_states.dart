import '../models/user.dart';

/// GET USER STATE
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

/// ADD USER STATE
abstract class AddUserState {}

class SuccessAddUserState extends AddUserState {}

class ErrorAddUserState extends AddUserState {
  final Exception exception;

  ErrorAddUserState(this.exception);
}
