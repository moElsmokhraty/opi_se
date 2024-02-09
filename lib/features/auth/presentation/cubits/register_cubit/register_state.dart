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

class ChangePasswordVisibility extends RegisterState {}

class ChangeAgree extends RegisterState {}

class NationalIdImagePicked extends RegisterState {}

class UploadNationalIdImageLoading extends RegisterState {}

class UploadNationalIdImageSuccess extends RegisterState {}

class UploadNationalIdImageFailure extends RegisterState {
  UploadNationalIdImageFailure(this.errMessage);

  final String errMessage;
}

class GetLocationLoading extends RegisterState {}

class GetLocationSuccess extends RegisterState {}

class GetLocationFailure extends RegisterState {}
