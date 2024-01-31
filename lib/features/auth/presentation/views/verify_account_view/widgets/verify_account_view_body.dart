import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'resend_mail_button.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../cubits/verify_account_cubit/verify_account_cubit.dart';

class VerifyAccountViewBody extends StatelessWidget {
  const VerifyAccountViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    VerifyAccountCubit cubit = BlocProvider.of<VerifyAccountCubit>(context);
    return BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
      listener: (context, state) {
        if (state is VerifyAccountFailure) {
          showCustomSnackBar(context, state.errMessage);
        } else if (state is VerifyAccountSuccess) {
          showCustomSnackBar(context, 'Email sent successfully!');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(RoutesConfig.login);
                  },
                  child: Text(
                    'Skip',
                    style: AppStyles.textStyle12.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/verify_account.png',
                height: 350.h,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Text(
                'Check your email',
                style: AppStyles.textStyle24.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Text(
                'We have just sent a verification email to $email.',
                style: AppStyles.textStyle12.copyWith(fontSize: 15.sp),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              ResendEmailButton(email: email, cubit: cubit, state: state),
            ],
          ),
        );
      },
    );
  }
}
