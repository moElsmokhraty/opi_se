import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import 'package:opi_se/core/functions/validate_password.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/login_view/widgets/register_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showCustomSnackBar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          showCustomSnackBar(context, 'Logged in successfully!');
        }
      },
      builder: (context, state) {
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
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
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
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
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
                state is LoginLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xff036666)))
                    : AuthButton(
                        text: 'Login',
                        onPressed: cubit.login,
                        backColor: const Color(0xff036666),
                        textColor: Colors.white,
                      ),
                SizedBox(height: screenHeight * 0.035),
                const RegisterText(),
              ],
            ),
          ),
        );
      },
    );
  }
}
