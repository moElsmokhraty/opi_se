part of 'mentor_login_cubit.dart';

@immutable
sealed class MentorLoginState {}

final class MentorLoginInitial extends MentorLoginState {}

class LoginLoading extends MentorLoginState {}

class LoginSuccess extends MentorLoginState {
  final MentorLoginResponse response;

  LoginSuccess(this.response);
}

class LoginFailure extends MentorLoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

class ChangePasswordVisibility extends MentorLoginState {}
