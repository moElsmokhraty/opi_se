import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/otp_models/verify_otp_request.dart';
import '../../../domain/use_cases/mentor_verify_otp_use_case.dart';
import '../../views/mentor_login_otp_view/widgets/otp_text_field.dart';

part 'mentor_login_otp_state.dart';

class MentorLoginOtpCubit extends Cubit<MentorLoginOtpState> {
  MentorLoginOtpCubit(
    this.mentorVerifyOtpUseCase,
  ) : super(MentorLoginOtpInitial());

  final MentorVerifyOtpUseCase mentorVerifyOtpUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final OtpFieldController controller = OtpFieldController();

  String otp = '';

  Future<void> verifyOtp(String email) async {
    if (formKey.currentState!.validate()) {
      emit(MentorLoginOtpLoading());
      final response = await mentorVerifyOtpUseCase(VerifyOtpRequest(
        otpCode: otp,
        email: email,
      ));
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
}
