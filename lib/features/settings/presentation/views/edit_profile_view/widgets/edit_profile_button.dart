import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/edit_profile_cubit.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0XFF036666)),
          );
        } else {
          return AuthButton(
            text: 'Save Changes',
            onPressed: () {},
            backColor: const Color(0XFF036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
