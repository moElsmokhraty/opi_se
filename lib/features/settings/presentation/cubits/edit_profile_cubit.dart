import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/features/settings/data/models/edit_profile_request.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../../auth/data/models/login_models/login_response/language.dart';
import '../../domain/use_cases/edit_profile_use_case.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitial());

  final EditProfileUseCase _editProfileUseCase;

  @override
  Future<void> close() async {
    userNameController.dispose();
    emailController.dispose();
    nativeLanguageController.dispose();
    nativeLevelController.dispose();
    secondLanguageController.dispose();
    secondLevelController.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nativeLanguageController = TextEditingController();

  TextEditingController nativeLevelController = TextEditingController();

  TextEditingController secondLanguageController = TextEditingController();

  TextEditingController secondLevelController = TextEditingController();

  TextEditingController thirdLanguageController = TextEditingController();

  TextEditingController thirdLevelController = TextEditingController();

  void setInitialValues() {
    print(userCache?.email ?? '');
    userNameController.text = userCache?.userName ?? '';
    emailController.text = userCache?.email ?? '';
    if (userCache?.languages?.isNotEmpty ?? false) {
      nativeLanguageController.text =
          userCache?.languages?[0].languageName ?? '';
      nativeLevelController.text =
          userCache?.languages?[0].level.toString() ?? '1';
      if (userCache?.languages?.length == 2) {
        secondLanguageController.text =
            userCache?.languages?[1].languageName ?? '';
        secondLevelController.text =
            userCache?.languages?[1].level.toString() ?? '1';
      }
      if (userCache?.languages?.length == 3) {
        thirdLanguageController.text =
            userCache?.languages?[2].languageName ?? '';
        thirdLevelController.text =
            userCache?.languages?[2].level.toString() ?? '1';
      }
    }
  }

  List<Language> getLanguages() {
    return [
      if (nativeLanguageController.text.trim().isNotEmpty)
        Language(
          languageName: nativeLanguageController.text.trim(),
          level: int.parse(nativeLevelController.text),
        ),
      if (secondLanguageController.text.trim().isNotEmpty)
        Language(
          languageName: secondLanguageController.text.trim(),
          level: int.parse(secondLevelController.text),
        ),
      if (thirdLanguageController.text.trim().isNotEmpty)
        Language(
          languageName: thirdLanguageController.text.trim(),
          level: int.parse(thirdLevelController.text),
        ),
    ];
  }

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    var result = await _editProfileUseCase.call(
      EditProfileRequest(
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        languages: getLanguages(),
      ),
    );
    result.fold(
      (failure) => emit(EditProfileFailure(failure: failure)),
      (response) => emit(EditProfileSuccess(response: response)),
    );
  }
}
