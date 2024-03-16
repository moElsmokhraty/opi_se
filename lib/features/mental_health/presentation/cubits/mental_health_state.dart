part of 'mental_health_cubit.dart';

@immutable
abstract class MentalHealthState {}

class MentalHealthInitial extends MentalHealthState {}

class MentalHealthGenderSelected extends MentalHealthState {}

class MentalHealthEducationSelected extends MentalHealthState {}

class MentalHealthEmploymentSelected extends MentalHealthState {}

class MentalHealthGapsInResumeSelected extends MentalHealthState {}

class MentalHealthPCSelected extends MentalHealthState {}

class MentalHealthInternetSelected extends MentalHealthState {}

class MentalHealthLiveWithParentsSelected extends MentalHealthState {}

class MentalHealthReadOutSelected extends MentalHealthState {}

class MentalHealthDisabledSelected extends MentalHealthState {}

class MentalHealthHospitalizedSelected extends MentalHealthState {}

class MentalHealthNervousWithoutClearReasonSelected extends MentalHealthState {}

class MentalHealthExcessiveWorryOrFearSelected extends MentalHealthState {}

class MentalHealthOnEdgeSelected extends MentalHealthState {}

class MentalHealthFeelDownSelected extends MentalHealthState {}

class MentalHealthLostInterestInActivitiesSelected extends MentalHealthState {}

class MentalHealthDifficultyConcentratingSelected extends MentalHealthState {}

class MentalHealthChallengingToFocusSelected extends MentalHealthState {}

class MentalHealthCaughtInRepetitiveThoughtsSelected
    extends MentalHealthState {}

class MentalHealthIntrusiveThoughtsSelected extends MentalHealthState {}

class MentalHealthSuddenChangesInMoodSelected extends MentalHealthState {}

class MentalHealthMoodChangesSelected extends MentalHealthState {}

class MentalHealthHardToControlEmotionsSelected extends MentalHealthState {}

class MentalHealthIntenseFearSelected extends MentalHealthState {}

class MentalHealthEngageInRepetitiveBehaviorsSelected
    extends MentalHealthState {}

class MentalHealthDrivenToPerformRepetitiveActsSelected
    extends MentalHealthState {}

class MentalHealthFeelTiredAfterEnoughSleepSelected extends MentalHealthState {}

class MentalHealthChangesInSleepPatternsSelected extends MentalHealthState {}

class MentalHealthLoading extends MentalHealthState {}

class MentalHealthFailure extends MentalHealthState {
  final String message;

  MentalHealthFailure(this.message);
}

class MentalHealthSuccess extends MentalHealthState {
  final List<String> result;

  MentalHealthSuccess(this.result);
}
