part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final GetProfileResponse response;

  GetProfileSuccess(this.response);
}

class GetProfileFailure extends ProfileState {
  final Failure failure;

  GetProfileFailure(this.failure);
}

class DeleteProfileImageLoading extends ProfileState {}

class DeleteProfileImageSuccess extends ProfileState {
  final String message;

  DeleteProfileImageSuccess(this.message);
}

class DeleteProfileImageFailure extends ProfileState {
  final Failure failure;

  DeleteProfileImageFailure(this.failure);
}

class UploadProfileImageLoading extends ProfileState {}

class UploadProfileImageSuccess extends ProfileState {
  final String message;

  UploadProfileImageSuccess(this.message);
}

class UploadProfileImageFailure extends ProfileState {
  final Failure failure;

  UploadProfileImageFailure(this.failure);
}
