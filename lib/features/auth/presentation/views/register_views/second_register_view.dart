import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/second_register_view_body.dart';

class SecondRegisterView extends StatelessWidget {
  const SecondRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
       GoRouter.of(context).pop();
      },
      child: const SafeArea(
        child: Scaffold(
          appBar: AuthAppBar(),
          body: SecondRegisterViewBody(),
        ),
      ),
    );
  }
}
