import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import '../../../data/models/change_password_models/change_password_response.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordInitial());

  final ChangePasswordUseCase _changePasswordUseCase;

  @override
  Future<void> close() async {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  bool currentObscureText = true;

  bool newObscureText = true;

  bool confirmNewObscureText = true;

  Icon currentIcon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  Icon newIcon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  Icon confirmNewIcon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ChangePasswordLoading());
    var result = await _changePasswordUseCase.call(
      ChangePasswordRequest(
        oldPassword: currentPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        confirmNewPassword: confirmNewPasswordController.text.trim(),
      ),
    );
    result.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
    }, (response) {
      emit(ChangePasswordSuccess(response));
    });
  }

  void changeCurrentPasswordVisibility() {
    currentObscureText = !currentObscureText;
    currentIcon = currentObscureText
        ? Icon(
            Icons.visibility_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          )
        : Icon(
            Icons.visibility_off_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          );
    emit(ChangeCurrentPasswordVisibility());
  }

  void changeNewPasswordVisibility() {
    newObscureText = !newObscureText;
    newIcon = newObscureText
        ? Icon(
            Icons.visibility_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          )
        : Icon(
            Icons.visibility_off_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          );
    emit(ChangeNewPasswordVisibility());
  }

  void changeConfirmNewPasswordVisibility() {
    confirmNewObscureText = !confirmNewObscureText;
    confirmNewIcon = confirmNewObscureText
        ? Icon(
            Icons.visibility_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          )
        : Icon(
            Icons.visibility_off_outlined,
            size: 21.sp,
            color: const Color(0xff036666),
          );
    emit(ChangeConfirmNewPasswordVisibility());
  }
}
