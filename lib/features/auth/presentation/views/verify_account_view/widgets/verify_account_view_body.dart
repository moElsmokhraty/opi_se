import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/presentation/cubits/verify_account_cubit/verify_account_cubit.dart';

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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Image.asset(
                'assets/images/verify_account.png',
                height: 350.h,
                width: width,
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
                'We have just sent a verification email to your email lol@gmail.com',
                style: AppStyles.textStyle12.copyWith(fontSize: 15.sp),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.06),
              state is VerifyAccountLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff036666)))
                  : AuthButton(
                      text: 'Resend Email',
                      onPressed: () async {
                        await cubit.verifyAccount(email);
                      },
                      backColor: const Color(0xff036666),
                      textColor: Colors.white,
                    ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        );
      },
    );
  }
}
