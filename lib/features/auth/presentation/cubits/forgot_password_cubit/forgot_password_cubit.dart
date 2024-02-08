import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/forgot_password_models/forgot_password_response.dart';
import 'package:opi_se/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_request.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPasswordUseCase)
      : super(ForgotPasswordInitial());

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  @override
  Future<void> close() async {
    emailController.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  Future<void> forgotPassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ForgotPasswordLoading());
    var result = await _forgotPasswordUseCase.call(
      ForgotPasswordRequest(email: emailController.text.trim()),
    );
    result.fold((failure) {
      emit(ForgotPasswordFailure(failure.errMessage));
    }, (response) {
      emit(ForgotPasswordSuccess(response));
    });
  }
}
