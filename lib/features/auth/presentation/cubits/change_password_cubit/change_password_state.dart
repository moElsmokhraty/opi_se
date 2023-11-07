part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponse response;

  ChangePasswordSuccess(this.response);
}

class ChangePasswordFailure extends ChangePasswordState {
  final String errMessage;

  ChangePasswordFailure(this.errMessage);
}

class ChangePasswordVisibility extends ChangePasswordState {}
