import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../data/models/login_models/login_response/user_cache.dart';
import '../../../cubits/change_password_cubit/change_password_cubit.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChangePasswordCubit>(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          while (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
          Hive.box<UserCache>(boxName).clear();
          GoRouter.of(context).push(RoutesConfig.successfulChange);
          showCustomSnackBar(context, 'Password changed successfully');
        } else if (state is ChangePasswordFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      listenWhen: (previous, current) {
        return current is ChangePasswordSuccess ||
            current is ChangePasswordFailure;
      },
      buildWhen: (previous, current) {
        return current is ChangePasswordLoading ||
            previous is ChangePasswordLoading;
      },
      builder: (context, state) {
        if (state is ChangePasswordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        } else {
          return AuthButton(
            text: 'Save',
            onPressed: () async {
              await cubit.changePassword();
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
