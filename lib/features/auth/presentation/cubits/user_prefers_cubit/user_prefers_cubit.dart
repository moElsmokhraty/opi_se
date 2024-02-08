import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_question.dart';
import '../../../data/models/login_models/login_response/user_skill.dart';
import '../../../data/models/user_prefers_models/user_prefers_request.dart';
import 'package:opi_se/features/auth/domain/use_cases/submit_user_prefers_use_case.dart';

part 'user_prefers_state.dart';

class UserPrefersCubit extends Cubit<UserPrefersState> {
  UserPrefersCubit(this._submitUserPrefersUseCase) : super(QuestionsInitial());

  final SubmitUserPrefersUseCase _submitUserPrefersUseCase;

  PageController pageController = PageController();

  TextEditingController fieldOfStudyController = TextEditingController();

  TextEditingController specializationController = TextEditingController();

  TextEditingController skillController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int skillLevel = 1;

  List<bool?> answers = [null, null, null, null];

  List<String> convertAnswers(List<bool?> answers) {
    List<String> convertedAnswers = [];
    for (bool? answer in answers) {
      if (answer == true) {
        convertedAnswers.add('yes');
      } else {
        convertedAnswers.add('no');
      }
    }
    return convertedAnswers;
  }

  final List<UserSkill> skills = [];

  bool sliderVisible = false;

  List<String> questions = [
    'Do you have Depression ?',
    'Do you have Anxiety ?',
    'Do you have Panic attack ?',
    'Did you seek any specialist for a treatment ?',
  ];

  void toggleSlider() {
    if (skillController.text.trim().isNotEmpty) {
      sliderVisible = true;
      emit(SliderVisibilityChanged());
    } else {
      sliderVisible = false;
      emit(SliderVisibilityChanged());
    }
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void setAnswer(int index, bool value) {
    answers[index] = value;
    emit(QuestionsAnswered());
  }

  void addSkill() {
    UserSkill newSkill = UserSkill(
      skillName: skillController.text.trim(),
      skillRate: skillLevel,
    );

    bool containsSkill() {
      for (UserSkill s in skills) {
        if (s.skillName == newSkill.skillName) {
          return true;
        }
      }
      return false;
    }

    if (newSkill.skillName!.isNotEmpty && !containsSkill()) {
      skills.add(newSkill);
      skillController.clear();
      skillLevel = 1;
      sliderVisible = false;
      emit(SkillsChanged());
    }
  }

  void setSkillLevel(int value) {
    skillLevel = value;
    emit(SkillsChanged());
  }

  void removeSkill(UserSkill skill) {
    skills.remove(skill);
    sliderVisible = false;
    emit(SkillsChanged());
  }

  Future<void> submitUserPrefers() async {
    emit(SubmitUserPrefersLoading());
    List<String> finalAnswers = convertAnswers(answers);
    List<UserQuestion> finalQuestions = [
      UserQuestion(
        question: questions[0],
        answer: finalAnswers[0],
      ),
      UserQuestion(
        question: questions[1],
        answer: finalAnswers[1],
      ),
      UserQuestion(
        question: questions[2],
        answer: finalAnswers[2],
      ),
      UserQuestion(
        question: questions[3],
        answer: finalAnswers[3],
      ),
    ];
    var result = await _submitUserPrefersUseCase.call(
      UserPrefersRequest(
        fieldOfStudy: fieldOfStudyController.text.trim(),
        specialization: specializationController.text.trim(),
        userSkills: skills,
        userQuestions: finalQuestions,
      ),
    );
    result.fold(
      (failure) => emit(SubmitUserPrefersFailure(failure.errMessage)),
      (response) => emit(SubmitUserPrefersSuccess()),
    );
  }
}
