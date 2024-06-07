import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../views/mentor_login_otp_view/widgets/otp_text_field.dart';

part 'mentor_login_otp_state.dart';

class MentorLoginOtpCubit extends Cubit<MentorLoginOtpState> {
  MentorLoginOtpCubit() : super(MentorLoginOtpInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final OtpFieldController controller = OtpFieldController();

  String otp = '';
}
