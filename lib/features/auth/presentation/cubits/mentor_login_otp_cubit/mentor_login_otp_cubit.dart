import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/otp_models/verify_otp_request.dart';
import '../../../domain/use_cases/mentor_resend_otp_use_case.dart';
import '../../../domain/use_cases/mentor_verify_otp_use_case.dart';

part 'mentor_login_otp_state.dart';

class MentorLoginOtpCubit extends Cubit<MentorLoginOtpState> {
  MentorLoginOtpCubit(
    this.mentorVerifyOtpUseCase,
    this.mentorResendOtpUseCase,
  ) : super(MentorLoginOtpInitial());

  final MentorVerifyOtpUseCase mentorVerifyOtpUseCase;
  final MentorResendOtpUseCase mentorResendOtpUseCase;

  String otp = '';

  Future<void> verifyOtp(String email) async {
    if (otp.length == 4 &&
        state is! MentorResendOtpLoading &&
        state is! MentorLoginOtpLoading) {
      emit(MentorLoginOtpLoading());
      final response = await mentorVerifyOtpUseCase.call(
        VerifyOtpRequest(
          otpCode: otp,
          email: email,
        ),
      );
      response.fold(
        (failure) {
          emit(MentorLoginOtpError(failure.errMessage));
        },
        (data) {
          emit(MentorLoginOtpSuccess());
        },
      );
    }
  }

  Future<void> resendOtp(String email) async {
    if (state is! MentorResendOtpLoading && state is! MentorLoginOtpLoading) {
      emit(MentorResendOtpLoading());
      final response = await mentorResendOtpUseCase.call(email);
      response.fold(
        (failure) {
          emit(MentorResendOtpError(failure.errMessage));
        },
        (data) {
          emit(MentorResendOtpSuccess());
        },
      );
    }
  }
}
