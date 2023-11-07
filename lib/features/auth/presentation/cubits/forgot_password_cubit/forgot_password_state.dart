part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotPasswordResponse response;

  ForgotPasswordSuccess(this.response);
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String errMessage;

  ForgotPasswordFailure(this.errMessage);
}
