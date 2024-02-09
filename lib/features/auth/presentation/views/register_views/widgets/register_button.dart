import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.state});

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    if (state is RegisterLoading) {
      return const Center(
          child: CircularProgressIndicator(color: Color(0xff036666)));
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
  }
}
