part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final dynamic response;

  EditProfileSuccess({required this.response});
}

class EditProfileFailure extends EditProfileState {
  final Failure failure;

  EditProfileFailure({required this.failure});
}
