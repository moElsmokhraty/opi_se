import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'forgot_password_button.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/validate_email.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import '../../../cubits/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          children: [
            Image.asset(
              'assets/images/forgot_password.png',
              height: 350.h,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Text(
              'Forgot Password',
              style: AppStyles.textStyle24,
            ),
            SizedBox(height: screenHeight * 0.0125),
            Text(
              'Enter your email and we will send you a password reset code',
              style: AppStyles.textStyle12.copyWith(fontSize: 15.sp),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.045),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: AppStyles.textStyle16.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
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
            SizedBox(height: screenHeight * 0.04),
            const ForgotPasswordButton(),
          ],
        ),
      ),
    );
  }
}
