part of 'mentor_login_otp_cubit.dart';

@immutable
sealed class MentorLoginOtpState {}

final class MentorLoginOtpInitial extends MentorLoginOtpState {}

final class MentorLoginOtpLoading extends MentorLoginOtpState {}

final class MentorLoginOtpSuccess extends MentorLoginOtpState {}

final class MentorLoginOtpError extends MentorLoginOtpState {
  final String message;

  MentorLoginOtpError(this.message);
}

final class MentorResendOtpLoading extends MentorLoginOtpState {}

final class MentorResendOtpSuccess extends MentorLoginOtpState {}

final class MentorResendOtpError extends MentorLoginOtpState {
  final String message;

  MentorResendOtpError(this.message);
}
