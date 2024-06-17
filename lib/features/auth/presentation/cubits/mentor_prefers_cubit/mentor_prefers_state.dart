part of 'mentor_prefers_cubit.dart';

@immutable
sealed class MentorPrefersState {}

final class MentorPrefersInitial extends MentorPrefersState {}

final class SliderVisibilityChanged extends MentorPrefersState {}

final class SkillsChanged extends MentorPrefersState {}

final class SubmitMentorPrefersLoading extends MentorPrefersState {}

class ResumePicked extends MentorPrefersState {}

class ExperienceAdded extends MentorPrefersState {}

class ExperienceDeleted extends MentorPrefersState {}

class CurrentlyWorkingChanged extends MentorPrefersState {}

class AddExperienceFieldsCleared extends MentorPrefersState {}

class EditExperienceFieldsCleared extends MentorPrefersState {}

class ExperienceEdited extends MentorPrefersState {}
