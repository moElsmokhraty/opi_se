import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  @override
  Future<void> close() async {
    fullNameController.dispose();
    phoneController.dispose();
    countryController.dispose();
    emailController.dispose();
    passwordController.dispose();
    companyNameController.dispose();
    emoji.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();

  TextEditingController emoji = TextEditingController();

  bool obscureText = true;

  Icon icon = const Icon(Icons.visibility);

  // Future<void> register(RegisterRequest request) async {
  //   emit(RegisterLoading());
  //   final result = await _registerUseCase(request);
  //   result.fold((failure) {
  //     emit(RegisterFailure(failure.errMessage));
  //   }, (success) {
  //     emit(RegisterSuccess());
  //   });
  // }

  void changeCountry(Country country) {
    countryController.text = country.name;
    emoji.text = country.flagEmoji;
    emit(CountryChanged());
  }

  void changePasswordVisibility() {
    obscureText = !obscureText;
    icon = obscureText
        ? Icon(Icons.visibility, size: 18.sp)
        : Icon(Icons.visibility_off, size: 18.sp);
    emit(ChangePasswordVisibility());
  }
}
