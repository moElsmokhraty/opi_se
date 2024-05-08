part of 'edit_user_prefers_cubit.dart';

@immutable
abstract class EditUserPrefersState {}

class EditUserPrefersInitial extends EditUserPrefersState {}

class SkillsChanged extends EditUserPrefersState {}

class SliderVisibilityChanged extends EditUserPrefersState {}

class EditUserPrefersLoading extends EditUserPrefersState {}

class EditUserPrefersSuccess extends EditUserPrefersState {}

class EditUserPrefersFailure extends EditUserPrefersState {
  final String errMessage;

  EditUserPrefersFailure(this.errMessage);
}
