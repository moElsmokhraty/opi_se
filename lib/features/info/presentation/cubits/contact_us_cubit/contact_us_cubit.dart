import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    formKey.currentState?.reset();
    return super.close();
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
