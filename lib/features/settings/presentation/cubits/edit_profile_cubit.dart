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

  TextEditingController userNameController = TextEditingController(
    text: userCache?.userName ?? '',
  );

  TextEditingController emailController = TextEditingController(
    text: userCache?.email ?? '',
  );

  TextEditingController nativeLanguageController = TextEditingController(
    text: userCache!.languages!.isEmpty ||
            userCache?.languages?[0].languageName == null
        ? ''
        : userCache?.languages?[0].languageName ?? '',
  );

  TextEditingController nativeLevelController = TextEditingController(
    text:
        userCache!.languages!.isEmpty || userCache?.languages?[0].level == null
            ? '1'
            : userCache?.languages?[0].languageName ?? '1',
  );

  TextEditingController secondLanguageController = TextEditingController(
    text: userCache!.languages!.length < 2 ||
            userCache?.languages?[1].languageName == null
        ? ''
        : userCache?.languages?[1].languageName ?? '',
  );

  TextEditingController secondLevelController = TextEditingController(
    text: userCache!.languages!.length < 2 ||
            userCache?.languages?[1].level == null
        ? '1'
        : userCache?.languages?[1].languageName ?? '1',
  );

  TextEditingController thirdLanguageController = TextEditingController(
    text: userCache!.languages!.length < 3 ||
            userCache?.languages?[2].languageName == null
        ? ''
        : userCache?.languages?[2].languageName ?? '',
  );

  TextEditingController thirdLevelController = TextEditingController(
    text: userCache!.languages!.length < 3 ||
            userCache?.languages?[2].languageName == null
        ? '1'
        : userCache?.languages?[2].languageName ?? '1',
  );

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
