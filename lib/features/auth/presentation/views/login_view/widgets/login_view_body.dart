import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_button.dart';
import 'register_text.dart';
import 'package:opi_se/core/functions/validate_password.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: (screenHeight * 0.12).h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Please, enter your details',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontFamily: 'Inter',
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              'Username',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            AuthTextField(
              controller: cubit.emailController,
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
              'Password',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) {
                return current is ChangePasswordVisibility;
              },
              builder: (context, state) {
                return AuthTextField(
                  controller: cubit.passwordController,
                  hintText: 'Enter Your Password',
                  obscureText: cubit.obscureText,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 8.w),
                    onPressed: cubit.changePasswordVisibility,
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
                );
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  color: const Color(0xff036666),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            const LoginButton(),
            SizedBox(height: screenHeight * 0.035),
            const RegisterText(),
          ],
        ),
      ),
    );
  }
}
