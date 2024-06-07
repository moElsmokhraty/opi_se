import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/routes_config/routes_config.dart';
import '../../../data/models/login_models/login_response/language.dart';

part 'mentor_register_state.dart';

class MentorRegisterCubit extends Cubit<MentorRegisterState> {
  MentorRegisterCubit() : super(MentorRegisterInitial());

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
    nationalIdController.dispose();
    firstFormKey.currentState?.reset();
    secondFormKey.currentState?.reset();
    super.close();
  }

  final firstFormKey = GlobalKey<FormState>();

  final secondFormKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController nativeLanguageController =
      TextEditingController();

  final TextEditingController nativeLevelController = TextEditingController();

  final TextEditingController secondLanguageController =
      TextEditingController();

  final TextEditingController secondLevelController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

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
    if (nativeLanguageController.text.trim().isNotEmpty &&
        secondLanguageController.text.trim().isNotEmpty) {
      return [
        Language(
          languageName: nativeLanguageController.text.trim(),
          level: int.parse(nativeLevelController.text),
        ),
        Language(
          languageName: secondLanguageController.text.trim(),
          level: int.parse(secondLevelController.text),
        ),
      ];
    } else {
      return [
        Language(
          languageName: nativeLanguageController.text.trim(),
          level: int.parse(nativeLevelController.text),
        ),
      ];
    }
  }

  void firstRegisterContinue(BuildContext context) {
    if (!agree) {
      showCustomSnackBar(
        context,
        'Please agree to the Terms of Use and Privacy Policy',
      );
    }
    if (firstFormKey.currentState!.validate() && agree) {
      GoRouter.of(context).push(
        RoutesConfig.mentorSecondRegister,
        extra: this,
      );
    }
  }

  Future<void> register() async {
    if (!secondFormKey.currentState!.validate()) return;
    emit(RegisterLoading());
    // final result = await _registerUseCase.call(
    //   RegisterRequest(
    //     userName: fullNameController.text.trim(),
    //     email: emailController.text.trim(),
    //     password: passwordController.text.trim(),
    //     confirmPassword: confirmPasswordController.text.trim(),
    //     location: locationController.text.trim(),
    //     age: int.parse(ageController.text.trim()),
    //     gender: genderController.text.trim().toLowerCase(),
    //     languages: filteredLanguages(),
    //     nationalId: nationalIdController.text.trim(),
    //   ),
    // );
    // result.fold((failure) {
    //   emit(RegisterFailure(failure.errMessage));
    // }, (success) {
    //   emit(RegisterSuccess());
    // });
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
}
