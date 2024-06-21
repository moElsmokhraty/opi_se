import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_text_field.dart';
import 'mentor_login_otp_button.dart';
import '../../../cubits/mentor_login_otp_cubit/mentor_login_otp_cubit.dart';
import 'resend_otp_button.dart';

class MentorLoginOtpViewBody extends StatelessWidget {
  const MentorLoginOtpViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final cubit = BlocProvider.of<MentorLoginOtpCubit>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
      child: Column(
        children: [
          Image.asset(
            'assets/images/otp.png',
            width: 1.sw,
            height: 350.h,
            alignment: Alignment.center,
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'Email Verification',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.0125),
          Text(
            'Please type OTP code that you received',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          OTPTextField(
            fieldWidth: 70.w,
            width: 1.sw,
            onChanged: (value) {
              cubit.otp = value;
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          ResendOtpButton(email: email),
          SizedBox(height: screenHeight * 0.04),
          MentorLoginOtpButton(email: email),
        ],
      ),
    );
  }
}
