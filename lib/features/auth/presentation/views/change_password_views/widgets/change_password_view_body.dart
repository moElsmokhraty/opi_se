import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'change_password_button.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../../../../core/functions/validate_password.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import '../../../cubits/change_password_cubit/change_password_cubit.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    ChangePasswordCubit cubit = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          GoRouter.of(context).pushReplacement(RoutesConfig.successfulChange);
        } else if (state is ChangePasswordFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: SizedBox(
              height: screenHeight - 60.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'Your new password must be different from previous used password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff9094A0),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'Current Password',
                    style: AppStyles.textStyle16.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  AuthTextField(
                    controller: cubit.currentPasswordController,
                    hintText: 'Enter Your Current Password',
                    obscureText: cubit.oldObscureText,
                    suffixIcon: GestureDetector(
                      onTap: cubit.changeOldPasswordVisibility,
                      child: cubit.oldIcon,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      size: 21.sp,
                      color: const Color(0xff036666),
                    ),
                    validator: (value) {
                      return validatePassword(value!)
                          ?.replaceAll('Password', 'Current Password');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'New Password',
                    style: AppStyles.textStyle16.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  AuthTextField(
                    controller: cubit.newPasswordController,
                    hintText: 'Enter Your New Password',
                    obscureText: cubit.newObscureText,
                    suffixIcon: GestureDetector(
                      onTap: cubit.changeNewPasswordVisibility,
                      child: cubit.newIcon,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_open_outlined,
                      size: 21.sp,
                      color: const Color(0xff036666),
                    ),
                    validator: (value) {
                      if (cubit.currentPasswordController.text ==
                              cubit.newPasswordController.text &&
                          cubit.newPasswordController.text.isNotEmpty) {
                        return 'New password must be different from old password';
                      } else {
                        return validatePassword(value!)
                            ?.replaceAll('Password', 'New Password');
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Confirm New Password',
                    style: AppStyles.textStyle16.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  AuthTextField(
                    controller: cubit.confirmNewPasswordController,
                    hintText: 'Confirm Your New Password',
                    obscureText: cubit.confirmNewObscureText,
                    suffixIcon: GestureDetector(
                      onTap: cubit.changeConfirmNewPasswordVisibility,
                      child: cubit.confirmNewIcon,
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
                        return validatePassword(value!)
                            ?.replaceAll('Password', 'Confirm New Password');
                      }
                    },
                  ),
                  const Spacer(flex: 3),
                  ChangePasswordButton(cubit: cubit, state: state),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
