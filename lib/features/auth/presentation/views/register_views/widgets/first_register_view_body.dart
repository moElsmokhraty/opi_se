import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/validate_email.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/functions/validate_password.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/login_text.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/register_label.dart';

class FirstRegisterViewBody extends StatelessWidget {
  const FirstRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: cubit.firstFormKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterLabel(),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Username',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.fullNameController,
                  hintText: 'Enter Your Username',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    return validateText('Username', value!);
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Email',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.emailController,
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    return validateEmail(value!);
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Password',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.passwordController,
                  hintText: 'Enter Your Password',
                  obscureText: cubit.obscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    icon: cubit.icon,
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
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Confirm Password',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.confirmPasswordController,
                  hintText: 'Confirm Your Password',
                  obscureText: cubit.confirmObscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: () {
                      cubit.changeConfirmPasswordVisibility();
                    },
                    icon: cubit.confirmIcon,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    return validatePassword(value!)?.replaceAll(
                      'Password',
                      'Confirm Password',
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Checkbox(
                      value: cubit.agree,
                      onChanged: (value) {
                        cubit.changeAgree();
                      },
                      activeColor: const Color(0xff036666),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(
                        color: const Color(0xff036666).withOpacity(0.5),
                        width: (1.5).w,
                        style: BorderStyle.solid,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Agree to the ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Use ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                            ),
                          ),
                          TextSpan(
                            text: 'Policy',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.035),
                AuthButton(
                  text: 'Continue',
                  onPressed: () {
                    cubit.firstRegisterContinue(context);
                  },
                  backColor: const Color(0xff036666),
                  textColor: Colors.white,
                ),
                SizedBox(height: screenHeight * 0.025),
                const LoginText(),
              ],
            ),
          ),
        );
      },
    );
  }
}
