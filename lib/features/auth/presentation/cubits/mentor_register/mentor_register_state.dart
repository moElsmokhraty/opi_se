part of 'mentor_register_cubit.dart';

@immutable
sealed class MentorRegisterState {}

final class MentorRegisterInitial extends MentorRegisterState {}

class RegisterLoading extends MentorRegisterState {}

class RegisterSuccess extends MentorRegisterState {}

class RegisterFailure extends MentorRegisterState {
  RegisterFailure(this.errMessage);

  final String errMessage;
}

class ChangePasswordVisibility extends MentorRegisterState {}

class ChangeAgree extends MentorRegisterState {}
