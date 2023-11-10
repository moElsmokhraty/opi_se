import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/functions/validate_email.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import '../../../../../../core/functions/validate_password.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/register_label.dart';

class FirstRegisterViewBody extends StatelessWidget {
  const FirstRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: cubit.firstFormKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                SizedBox(height: screenHeight * 0.025),
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
                SizedBox(height: screenHeight * 0.025),
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
                SizedBox(height: screenHeight * 0.025),
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
                    return validatePassword(value!);
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
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
                    SizedBox(
                      width: 290.w,
                      child: Wrap(
                        children: [
                          Text(
                            'Agree to the ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Terms of Use ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'and ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Privacy ',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Policy',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 12.sp,
                              color: const Color(0xff036666),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                AuthButton(
                  text: 'Continue',
                  onPressed: () {
                    if (cubit.firstFormKey.currentState!.validate()) {
                      GoRouter.of(context).push(RoutesConfig.secondRegister);
                    }
                  },
                  backColor: const Color(0xff036666),
                  textColor: Colors.white,
                ),
                SizedBox(height: screenHeight * 0.3),
              ],
            ),
          ),
        );
      },
    );
  }
}
