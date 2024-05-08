import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../domain/use_cases/edit_user_prefers_use_case.dart';
import '../../../data/models/login_models/login_response/user_skill.dart';
import '../../../data/models/user_prefers_models/user_prefers_request.dart';

part 'edit_user_prefers_state.dart';

class EditUserPrefersCubit extends Cubit<EditUserPrefersState> {
  EditUserPrefersCubit(this._editUserPrefersUseCase)
      : super(EditUserPrefersInitial());

  final EditUserPrefersUseCase _editUserPrefersUseCase;

  PageController pageController = PageController();

  TextEditingController fieldOfStudyController =
      TextEditingController(text: userCache!.fieldOfStudy);

  TextEditingController specializationController =
      TextEditingController(text: userCache!.specialization);

  TextEditingController skillController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int skillLevel = 1;

  final List<UserSkill> skills = userCache!.skills ?? [];

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

  Future<void> editUserPrefers() async {
    emit(EditUserPrefersLoading());
    var result = await _editUserPrefersUseCase.call(
      UserPrefersRequest(
        fieldOfStudy: fieldOfStudyController.text.trim(),
        specialization: specializationController.text.trim(),
        userSkills: skills,
      ),
    );
    result.fold(
      (failure) => emit(EditUserPrefersFailure(failure.errMessage)),
      (response) => emit(EditUserPrefersSuccess()),
    );
  }
}
