import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'mentor_login_state.dart';

class MentorLoginCubit extends Cubit<MentorLoginState> {
  MentorLoginCubit() : super(MentorLoginInitial());

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  bool obscureText = true;

  Icon icon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    // await FirebaseMessaging.instance.getToken().then((value) async {
    //   var result = await _loginUseCase.call(
    //     LoginRequest(
    //       userName: emailController.text.trim(),
    //       password: passwordController.text.trim(),
    //       deviceToken: value,
    //     ),
    //   );
    //   result.fold((failure) {
    //     emit(LoginFailure(failure.errMessage));
    //   }, (response) {
    //     emit(LoginSuccess(response));
    //   });
    // });
  }

  void changePasswordVisibility() {
    obscureText = !obscureText;
    icon = obscureText
        ? Icon(Icons.visibility_outlined,
            size: 21.sp, color: const Color(0xff036666))
        : Icon(Icons.visibility_off_outlined,
            size: 21.sp, color: const Color(0xff036666));
    emit(ChangePasswordVisibility());
  }
}
