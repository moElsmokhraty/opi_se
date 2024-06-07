import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showCustomSnackBar(context, state.errMessage);
        } else if (state is RegisterSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            RoutesConfig.verifyAccount,
            extra: cubit.emailController.text,
          );
        } else if (state is UploadNationalIdImageFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      listenWhen: (previous, current) {
        return current is RegisterFailure || current is RegisterSuccess;
      },
      buildWhen: (previous, current) {
        return current is RegisterLoading || previous is RegisterLoading;
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        } else {
          return AuthButton(
            text: 'Sign Up',
            onPressed: () async {
              await cubit.register();
            },
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          );
        }
      },
    );
  }
}
