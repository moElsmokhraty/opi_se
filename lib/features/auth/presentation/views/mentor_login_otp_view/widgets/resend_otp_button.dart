import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/mentor_login_otp_cubit/mentor_login_otp_cubit.dart';

class ResendOtpButton extends StatelessWidget {
  const ResendOtpButton({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MentorLoginOtpCubit>(context);
    return BlocConsumer<MentorLoginOtpCubit, MentorLoginOtpState>(
      listenWhen: (previous, current) {
        if (current is MentorResendOtpError ||
            current is MentorResendOtpSuccess) {
          return true;
        } else {
          return false;
        }
      },
      buildWhen: (previous, current) {
        if (current is MentorResendOtpError ||
            current is MentorResendOtpSuccess ||
            current is MentorResendOtpLoading) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is MentorResendOtpSuccess) {
          showCustomSnackBar(context, 'OTP code has been sent to your email');
        } else if (state is MentorResendOtpError) {
          showCustomSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await cubit.resendOtp(email);
                },
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t receive code? ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF036666),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is MentorResendOtpLoading) SizedBox(width: 10.w),
              if (state is MentorResendOtpLoading)
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF036666),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
