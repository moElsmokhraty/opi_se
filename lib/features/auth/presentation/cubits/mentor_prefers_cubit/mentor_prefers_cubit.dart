import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../data/models/login_models/login_response/user_skill.dart';
import '../../../data/models/mentor_prefers_models/experience.dart';

part 'mentor_prefers_state.dart';

class MentorPrefersCubit extends Cubit<MentorPrefersState> {
  MentorPrefersCubit() : super(MentorPrefersInitial());

  @override
  Future<void> close() async {
    setState();
    return super.close();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final PageController pageController = PageController();

  final TextEditingController fieldOfStudyController = TextEditingController();

  final TextEditingController specializationController =
      TextEditingController();

  final TextEditingController skillController = TextEditingController();

  final TextEditingController addExperienceTitleController =
      TextEditingController();

  final TextEditingController addExperienceEmploymentTypeController =
      TextEditingController();

  final TextEditingController addExperienceCompanyNameController =
      TextEditingController();

  final TextEditingController addExperienceStartDateController =
      TextEditingController();

  final TextEditingController addExperienceEndDateController =
      TextEditingController();

  TextEditingController editExperienceTitleController = TextEditingController();

  TextEditingController editExperienceEmploymentTypeController =
      TextEditingController();

  TextEditingController editExperienceCompanyNameController =
      TextEditingController();

  TextEditingController editExperienceStartDateController =
      TextEditingController();

  TextEditingController editExperienceEndDateController =
      TextEditingController();

  int skillLevel = 1;

  bool addExperienceIsCurrentlyWorking = false;

  bool editExperienceIsCurrentlyWorking = false;

  List<Skill> skills = [];

  List<Experience> experiences = [
    Experience(
      companyName: 'Google',
      title: 'Software Engineer',
      startDate: DateTime.now(),
      endDate: DateTime(2025, 12, 31),
      employmentType: 'Full-time',
    ),
    Experience(
      companyName: 'Facebook',
      title: 'Software Engineer',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      employmentType: 'Full-time',
    ),
  ];

  bool sliderVisible = false;

  PlatformFile? resume;

  List<PlatformFile> certificates = [];

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
    Skill newSkill = Skill(
      skillName: skillController.text.trim(),
      skillRate: skillLevel,
    );

    bool containsSkill() {
      for (Skill s in skills) {
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

  void removeSkill(Skill skill) {
    skills.remove(skill);
    sliderVisible = false;
    emit(SkillsChanged());
  }

  Future<void> nextPage() async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> previousPage() async {
    await pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      resume = result.files.first;
    }
    emit(ResumePicked());
  }

  Future<void> pickCertificates() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      for (PlatformFile file in result.files) {
        certificates.add(file);
      }
    }
    emit(ResumePicked());
  }

  Future<void> removeResume() async {
    resume = null;
    emit(ResumePicked());
  }

  Future<void> removeCertificate(int index) async {
    certificates.removeAt(index);
    emit(ResumePicked());
  }

  void addExperience() {
    experiences.add(
      Experience(
        companyName: addExperienceCompanyNameController.text.trim(),
        employmentType: addExperienceEmploymentTypeController.text.trim(),
        title: addExperienceTitleController.text.trim(),
        startDate: DateTime.parse(addExperienceStartDateController.text),
        endDate: addExperienceIsCurrentlyWorking
            ? DateTime.now()
            : DateTime.parse(addExperienceEndDateController.text),
      ),
    );
    emit(ExperienceAdded());
  }

  void deleteExperience(int index) {
    experiences.removeAt(index);
    emit(ExperienceDeleted());
  }

  void setStartDate(DateTime? date) {
    if (date != null) {
      addExperienceStartDateController.text = date.toString().substring(0, 10);
    }
  }

  void setEndDate(DateTime? date) {
    if (date != null) {
      addExperienceEndDateController.text = date.toString().substring(0, 10);
    }
  }

  void toggleAddExperienceIsCurrentlyWorking() {
    addExperienceIsCurrentlyWorking = !addExperienceIsCurrentlyWorking;
    if (addExperienceIsCurrentlyWorking) {
      addExperienceEndDateController.text = 'Present';
    } else {
      addExperienceEndDateController.clear();
    }
    emit(CurrentlyWorkingChanged());
  }

  void toggleEditExperienceIsCurrentlyWorking() {
    editExperienceIsCurrentlyWorking = !editExperienceIsCurrentlyWorking;
    if (editExperienceIsCurrentlyWorking) {
      editExperienceEndDateController.text = 'Present';
    } else {
      editExperienceEndDateController.clear();
    }
    emit(CurrentlyWorkingChanged());
  }

  void clearAddExperienceFields() {
    addExperienceTitleController.clear();
    addExperienceCompanyNameController.clear();
    addExperienceStartDateController.clear();
    addExperienceEndDateController.clear();
    addExperienceEmploymentTypeController.clear();
    addExperienceIsCurrentlyWorking = false;
    emit(AddExperienceFieldsCleared());
  }

  void clearEditExperienceFields() {
    editExperienceTitleController.clear();
    editExperienceCompanyNameController.clear();
    editExperienceStartDateController.clear();
    editExperienceEndDateController.clear();
    editExperienceEmploymentTypeController.clear();
    editExperienceIsCurrentlyWorking = false;
    emit(EditExperienceFieldsCleared());
  }

  void setEditExperienceInitialValues(Experience experience) {
    editExperienceTitleController.text = experience.title;
    editExperienceCompanyNameController.text = experience.companyName;
    editExperienceStartDateController.text =
        experience.startDate.toString().substring(0, 10);
    editExperienceEndDateController.text =
        experience.endDate.toString().substring(0, 10);
    editExperienceEmploymentTypeController.text = experience.employmentType;
    editExperienceIsCurrentlyWorking =
        experience.endDate?.difference(DateTime.now()).inDays == 0;
  }

  Future<void> editExperience(int index) async {
    experiences[index] = Experience(
      title: editExperienceTitleController.text.trim(),
      employmentType: editExperienceEmploymentTypeController.text.trim(),
      companyName: editExperienceCompanyNameController.text.trim(),
      startDate: DateTime.parse(editExperienceStartDateController.text.trim()),
      endDate: editExperienceIsCurrentlyWorking
          ? DateTime.now()
          : DateTime.parse(editExperienceEndDateController.text.trim()),
    );
  }

  void setState() {
    emit(ExperienceEdited());
  }
}
