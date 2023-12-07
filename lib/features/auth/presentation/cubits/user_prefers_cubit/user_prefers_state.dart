part of 'user_prefers_cubit.dart';

@immutable
abstract class UserPrefersState {}

class QuestionsInitial extends UserPrefersState {}

class QuestionsAnswered extends UserPrefersState {}

class SkillsChanged extends UserPrefersState {}

class SliderVisibilityChanged extends UserPrefersState {}

class SubmitUserPrefersLoading extends UserPrefersState {}

class SubmitUserPrefersSuccess extends UserPrefersState {}

class SubmitUserPrefersFailure extends UserPrefersState {
  final String errMessage;

  SubmitUserPrefersFailure(this.errMessage);
}
