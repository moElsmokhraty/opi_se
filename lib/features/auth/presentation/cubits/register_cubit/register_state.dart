part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  RegisterFailure(this.errMessage);

  final String errMessage;
}

class CountryChanged extends RegisterState {}

class ChangePasswordVisibility extends RegisterState {}
