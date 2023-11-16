import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/data/models/register_models/language.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';

import '../../../data/models/register_models/register_request.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  final RegisterUseCase _registerUseCase;

  @override
  Future<void> close() async {
    fullNameController.dispose();
    ageController.dispose();
    locationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    genderController.dispose();
    nativeLanguageController.dispose();
    nativeLevelController.dispose();
    secondLanguageController.dispose();
    secondLevelController.dispose();
    firstFormKey.currentState?.reset();
    secondFormKey.currentState?.reset();
    super.close();
  }

  final firstFormKey = GlobalKey<FormState>();

  final secondFormKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController nativeLanguageController = TextEditingController();

  TextEditingController nativeLevelController = TextEditingController();

  TextEditingController secondLanguageController = TextEditingController();

  TextEditingController secondLevelController = TextEditingController();

  bool obscureText = true;

  bool confirmObscureText = true;

  bool agree = false;

  Icon icon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  Icon confirmIcon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  List<Language> filteredLanguages() {
    if (nativeLanguageController.text.isNotEmpty) {
      return [
        Language(
          languageName: nativeLanguageController.text,
          level: int.parse(nativeLevelController.text),
        ),
        Language(
          languageName: secondLanguageController.text,
          level: int.parse(secondLevelController.text),
        ),
      ];
    } else {
      return [
        Language(
          languageName: nativeLanguageController.text,
          level: int.parse(nativeLevelController.text),
        ),
      ];
    }
  }

  Future<void> register() async {
    if (!secondFormKey.currentState!.validate()) return;
    emit(RegisterLoading());
    final result = await _registerUseCase.call(
      RegisterRequest(
        userName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        location: locationController.text,
        age: int.parse(ageController.text),
        gender: genderController.text.toLowerCase(),
        languages: filteredLanguages(),
      ),
    );
    result.fold((failure) {
      emit(RegisterFailure(failure.errMessage));
    }, (success) {
      emit(RegisterSuccess());
    });
  }

  void changePasswordVisibility() {
    obscureText = !obscureText;
    icon = obscureText
        ? Icon(Icons.visibility, size: 21.sp)
        : Icon(Icons.visibility_off, size: 21.sp);
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    confirmObscureText = !confirmObscureText;
    confirmIcon = confirmObscureText
        ? Icon(Icons.visibility, size: 21.sp)
        : Icon(Icons.visibility_off, size: 21.sp);
    emit(ChangePasswordVisibility());
  }

  void changeAgree() {
    agree = !agree;
    emit(ChangeAgree());
  }

  Future<void> openMap(BuildContext context) async {
    await Geolocator.isLocationServiceEnabled().then((value) {
      if (!value) {
        showCustomSnackBar(context, 'Please enable location service');
      }
    });
  }
}

