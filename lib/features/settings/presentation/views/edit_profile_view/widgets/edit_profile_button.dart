import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/edit_profile_cubit.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../auth/data/models/login_models/login_response/user_cache.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit cubit = BlocProvider.of(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is EditProfileSuccess) {
          userCache!.userName = cubit.userNameController.text;
          userCache!.email = cubit.emailController.text;
          userCache!.languages = cubit.getLanguages();
          Hive.box<UserCache>(boxName).put('user', userCache!);
          GoRouter.of(context).pop();
          showCustomSnackBar(context, 'Profile updated successfully');
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0XFF036666)),
          );
        } else {
          return AuthButton(
            text: 'Save Changes',
            onPressed: () async {
              await cubit.editProfile();
            },
            backColor: const Color(0XFF036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
