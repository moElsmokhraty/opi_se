import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:opi_se/features/auth/domain/use_cases/change_password_use_case.dart';
import '../../../data/models/change_password_models/change_password_response.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase) : super(ChangePasswordInitial());

  final ChangePasswordUseCase _changePasswordUseCase;

  @override
  Future<void> close() async {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    formKey.currentState?.reset();
    super.close();
  }

  final formKey = GlobalKey<FormState>();

  bool oldObscureText = true;

  bool newObscureText = true;

  bool confirmNewObscureText = false;

  Icon oldIcon = Icon(
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

  final TextEditingController oldPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ChangePasswordLoading());
    var result = await _changePasswordUseCase.call(
      ChangePasswordRequest(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmNewPasswordController.text,
      ),
    );
    result.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
    }, (response) {
      emit(ChangePasswordSuccess(response));
    });
  }

  void changeOldPasswordVisibility() {
    oldObscureText = !oldObscureText;
    oldIcon = oldObscureText
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
    emit(ChangePasswordVisibility());
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
    emit(ChangePasswordVisibility());
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
    emit(ChangePasswordVisibility());
  }
}
