import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../../../core/functions/validate_password.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    ChangePasswordCubit cubit = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          showCustomSnackBar(context, 'Password changed successfully');
        } else if (state is ChangePasswordFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/change_password.png',
                  height: 300.h,
                  width: 300.w,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Reset Password',
                    maxLines: 2,
                    style: AppStyles.textStyle24,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Old Password',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.oldPasswordController,
                  hintText: 'Enter Your Old Password',
                  obscureText: cubit.oldObscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: cubit.changeOldPasswordVisibility,
                    icon: cubit.oldIcon,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                ),
                SizedBox(height: screenHeight * 0.025),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Password',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.newPasswordController,
                  hintText: 'Enter Your New Password',
                  obscureText: cubit.newObscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: cubit.changeNewPasswordVisibility,
                    icon: cubit.newIcon,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    if (cubit.oldPasswordController.text ==
                            cubit.newPasswordController.text &&
                        cubit.newPasswordController.text.isNotEmpty) {
                      return 'New password must be different from old password';
                    } else {
                      return validatePassword(value!);
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.025),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm New Password',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.confirmNewPasswordController,
                  hintText: 'Confirm Your New Password',
                  obscureText: cubit.confirmNewObscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: cubit.changeConfirmNewPasswordVisibility,
                    icon: cubit.confirmNewIcon,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    if (cubit.newPasswordController.text !=
                        cubit.confirmNewPasswordController.text) {
                      return 'Passwords don\'t match';
                    } else {
                      return validatePassword(value!);
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.025),
                state is ChangePasswordLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xff036666)),
                      )
                    : AuthButton(
                        text: 'Reset Password',
                        onPressed: () async {
                          await cubit.changePassword();
                        },
                        backColor: const Color(0xff036666),
                        textColor: Colors.white,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
