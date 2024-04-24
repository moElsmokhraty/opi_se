import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../data/models/login_models/login_request.dart';
import '../../../data/models/login_models/login_response/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

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
    await FirebaseMessaging.instance.getToken().then((value) async {
      var result = await _loginUseCase.call(
        LoginRequest(
          userName: emailController.text.trim(),
          password: passwordController.text.trim(),
          deviceToken: value,
        ),
      );
      result.fold((failure) {
        emit(LoginFailure(failure.errMessage));
      }, (response) {
        emit(LoginSuccess(response));
      });
    });
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
