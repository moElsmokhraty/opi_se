import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  final List<UserSkill> skills = [];

  bool sliderVisible = false;

  void toggleSlider() {
    if (skillController.text.trim().isNotEmpty) {
      sliderVisible = true;
      emit(SliderVisibilityChanged());
    } else {
      sliderVisible = false;
      emit(SliderVisibilityChanged());
    }
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
    var result = await _submitUserPrefersUseCase.call(
      UserPrefersRequest(
        fieldOfStudy: fieldOfStudyController.text.trim(),
        specialization: specializationController.text.trim(),
        userSkills: skills,
      ),
    );
    result.fold(
      (failure) => emit(SubmitUserPrefersFailure(failure.errMessage)),
      (response) => emit(SubmitUserPrefersSuccess()),
    );
  }
}
