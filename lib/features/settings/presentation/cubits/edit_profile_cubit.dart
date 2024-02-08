import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';
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

  Future<void> editProfile(request) async {
    emit(EditProfileLoading());
    var result = await _editProfileUseCase.call(request);
    result.fold(
      (failure) => emit(EditProfileFailure(failure: failure)),
      (response) => emit(EditProfileSuccess(response: response)),
    );
  }
}
