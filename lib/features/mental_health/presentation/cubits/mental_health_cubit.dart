import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';

import '../../data/models/mental_support_request.dart';
import '../../domain/use_cases/get_mental_support_use_case.dart';

part 'mental_health_state.dart';

class MentalHealthCubit extends Cubit<MentalHealthState> {
  MentalHealthCubit(this._getMentalSupportUseCase)
      : super(MentalHealthInitial());

  final GetMentalSupportUseCase _getMentalSupportUseCase;

  PageController pageController = PageController();
  final GlobalKey<FormState> firstPageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> thirdPageFormKey = GlobalKey<FormState>();
  TextEditingController ageController = TextEditingController();
  bool? isMale;
  String? education;
  bool? isEmployed;
  TextEditingController incomeController = TextEditingController();
  bool? haveGapsInResume;
  bool? havePC;
  bool? haveInternet;
  bool? liveWithParents;
  bool? readOut;
  bool? disabled;
  bool? hospitalized;
  TextEditingController timesHospitalizedController = TextEditingController();
  TextEditingController daysHospitalizedController = TextEditingController();
  bool? nervousWithoutClearReason;
  bool? excessiveWorryOrFear;
  bool? onEdge;
  bool? feelDown;
  bool? lostInterestInActivities;
  bool? difficultyConcentrating;
  bool? challengingToFocus;
  bool? caughtInRepetitiveThoughts;
  bool? intrusiveThoughts;
  bool? suddenChangesInMood;
  bool? hardToControlEmotions;
  bool? intenseFear;
  bool? engageInRepetitiveBehaviors;
  bool? drivenToPerformRepetitiveActs;
  bool? feelTiredAfterEnoughSleep;
  bool? changesInSleepPatterns;
  TextEditingController response1Controller = TextEditingController();
  TextEditingController response2Controller = TextEditingController();
  TextEditingController response3Controller = TextEditingController();
  TextEditingController response4Controller = TextEditingController();

  void setGender(bool gender) {
    isMale = gender;
    emit(MentalHealthGenderSelected());
  }

  void setEducation(String selectedEducation) {
    education = selectedEducation;
    emit(MentalHealthEducationSelected());
  }

  void setEmployment(bool employed) {
    isEmployed = employed;
    emit(MentalHealthEmploymentSelected());
  }

  void setGapsInResume(bool gaps) {
    haveGapsInResume = gaps;
    emit(MentalHealthGapsInResumeSelected());
  }

  void setPC(bool pc) {
    havePC = pc;
    emit(MentalHealthPCSelected());
  }

  void setInternet(bool internet) {
    haveInternet = internet;
    emit(MentalHealthInternetSelected());
  }

  void setLiveWithParents(bool liveWithParents) {
    this.liveWithParents = liveWithParents;
    emit(MentalHealthLiveWithParentsSelected());
  }

  void setReadOut(bool readOut) {
    this.readOut = readOut;
    emit(MentalHealthReadOutSelected());
  }

  void setDisabled(bool disabled) {
    this.disabled = disabled;
    emit(MentalHealthDisabledSelected());
  }

  void setHospitalized(bool hospitalized) {
    this.hospitalized = hospitalized;
    emit(MentalHealthHospitalizedSelected());
  }

  void firstPageNext(BuildContext context) {
    if (firstPageFormKey.currentState!.validate() &&
        isMale != null &&
        education != null &&
        isEmployed != null &&
        haveGapsInResume != null &&
        havePC != null &&
        haveInternet != null &&
        liveWithParents != null &&
        readOut != null &&
        disabled != null &&
        hospitalized != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      showCustomSnackBar(context, 'Please answer all questions');
    }
  }

  void setNervousWithoutClearReason(bool nervous) {
    nervousWithoutClearReason = nervous;
    emit(MentalHealthNervousWithoutClearReasonSelected());
  }

  void setExcessiveWorryOrFear(bool worry) {
    excessiveWorryOrFear = worry;
    emit(MentalHealthExcessiveWorryOrFearSelected());
  }

  void setOnEdge(bool edge) {
    onEdge = edge;
    emit(MentalHealthOnEdgeSelected());
  }

  void setFeelDown(bool feelDown) {
    this.feelDown = feelDown;
    emit(MentalHealthFeelDownSelected());
  }

  void setLostInterestInActivities(bool lostInterest) {
    lostInterestInActivities = lostInterest;
    emit(MentalHealthLostInterestInActivitiesSelected());
  }

  void setDifficultyConcentrating(bool difficulty) {
    difficultyConcentrating = difficulty;
    emit(MentalHealthDifficultyConcentratingSelected());
  }

  void setChallengingToFocus(bool challenging) {
    challengingToFocus = challenging;
    emit(MentalHealthChallengingToFocusSelected());
  }

  void setCaughtInRepetitiveThoughts(bool caught) {
    caughtInRepetitiveThoughts = caught;
    emit(MentalHealthCaughtInRepetitiveThoughtsSelected());
  }

  void setIntrusiveThoughts(bool intrusive) {
    intrusiveThoughts = intrusive;
    emit(MentalHealthIntrusiveThoughtsSelected());
  }

  void setSuddenChangesInMood(bool suddenChanges) {
    suddenChangesInMood = suddenChanges;
    emit(MentalHealthSuddenChangesInMoodSelected());
  }

  void setHardToControlEmotions(bool hardToControl) {
    hardToControlEmotions = hardToControl;
    emit(MentalHealthHardToControlEmotionsSelected());
  }

  void setIntenseFear(bool intenseFear) {
    this.intenseFear = intenseFear;
    emit(MentalHealthIntenseFearSelected());
  }

  void setEngageInRepetitiveBehaviors(bool engageInRepetitiveBehaviors) {
    this.engageInRepetitiveBehaviors = engageInRepetitiveBehaviors;
    emit(MentalHealthEngageInRepetitiveBehaviorsSelected());
  }

  void setDrivenToPerformRepetitiveActs(bool drivenToPerformRepetitiveActs) {
    this.drivenToPerformRepetitiveActs = drivenToPerformRepetitiveActs;
    emit(MentalHealthDrivenToPerformRepetitiveActsSelected());
  }

  void setFeelTiredAfterEnoughSleep(bool tiredAfterEnoughSleep) {
    feelTiredAfterEnoughSleep = tiredAfterEnoughSleep;
    emit(MentalHealthFeelTiredAfterEnoughSleepSelected());
  }

  void setChangesInSleepPatterns(bool changesInSleepPatterns) {
    this.changesInSleepPatterns = changesInSleepPatterns;
    emit(MentalHealthChangesInSleepPatternsSelected());
  }

  void secondPageNext(BuildContext context) {
    if (nervousWithoutClearReason != null &&
        excessiveWorryOrFear != null &&
        onEdge != null &&
        feelDown != null &&
        lostInterestInActivities != null &&
        difficultyConcentrating != null &&
        challengingToFocus != null &&
        caughtInRepetitiveThoughts != null &&
        intrusiveThoughts != null &&
        suddenChangesInMood != null &&
        hardToControlEmotions != null &&
        intenseFear != null &&
        engageInRepetitiveBehaviors != null &&
        drivenToPerformRepetitiveActs != null &&
        feelTiredAfterEnoughSleep != null &&
        changesInSleepPatterns != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      showCustomSnackBar(context, 'Please answer all questions');
    }
  }

  void secondPagePrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void thirdPagePrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Future<void> getMentalSupport() async {
    emit(MentalHealthLoading());
    final response = await _getMentalSupportUseCase.call(
      MentalSupportRequest(
        age: int.tryParse(ageController.text),
        gender: isMale! ? 'Male' : 'Female',
        education: education!,
        employed: isEmployed! ? 'yes' : 'no',
        income: int.tryParse(incomeController.text),
        gapInResume: haveGapsInResume! ? 'yes' : 'no',
        pc: havePC! ? 'yes' : 'no',
        internetAccess: haveInternet! ? 'yes' : 'no',
        liveWithParents: liveWithParents! ? 'yes' : 'no',
        readOut: readOut! ? 'yes' : 'no',
        disabled: disabled! ? 'yes' : 'no',
        mentalIllnessB4: hospitalized! ? 'yes' : 'no',
        timesHosp: int.tryParse(timesHospitalizedController.text),
        daysHosp: int.tryParse(daysHospitalizedController.text),
        anxiety1: nervousWithoutClearReason! ? 'yes' : 'no',
        anxiety2: excessiveWorryOrFear! ? 'yes' : 'no',
        anxiety3: onEdge! ? 'yes' : 'no',
        depression1: feelDown! ? 'yes' : 'no',
        depression2: lostInterestInActivities! ? 'yes' : 'no',
        lackOfConcentration1: difficultyConcentrating! ? 'yes' : 'no',
        lackOfConcentration2: challengingToFocus! ? 'yes' : 'no',
        obsessiveThinking1: caughtInRepetitiveThoughts! ? 'yes' : 'no',
        obsessiveThinking2: intrusiveThoughts! ? 'yes' : 'no',
        moodSwing1: suddenChangesInMood! ? 'yes' : 'no',
        moodSwing2: hardToControlEmotions! ? 'yes' : 'no',
        panicAttacks: intenseFear! ? 'yes' : 'no',
        compulsiveBehavior1: engageInRepetitiveBehaviors! ? 'yes' : 'no',
        compulsiveBehavior2: drivenToPerformRepetitiveActs! ? 'yes' : 'no',
        tiredness1: feelTiredAfterEnoughSleep! ? 'yes' : 'no',
        tiredness2: changesInSleepPatterns! ? 'yes' : 'no',
      ),
    );
    response.fold(
      (failure) => emit(MentalHealthFailure(failure.errMessage)),
      (texts) => emit(MentalHealthSuccess(texts)),
    );
  }
}
