import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/cache_user_data.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import 'package:opi_se/core/functions/validate_password.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
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
          if (state.errMessage == 'please verify your account first !') {
            GoRouter.of(context).pushReplacement(
              RoutesConfig.verifyAccount,
              extra: cubit.emailController.text,
            );
          } else {
            showCustomSnackBar(context, state.errMessage);
          }
        } else if (state is LoginSuccess) {
          if (state.response.data!.getUserPrefers!) {
            cacheUserData(state.response);
            GoRouter.of(context).pushReplacement(RoutesConfig.userPrefers);
            showCustomSnackBar(context, 'Please set your prefers first!');
          } else {
            cacheUserData(state.response);
            SocketService.connect();
            showCustomSnackBar(context, 'Logged in successfully!');
            GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
          }
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
                        onPressed: () async {
                          await cubit.login();
                        },
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
