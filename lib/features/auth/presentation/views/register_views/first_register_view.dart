import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/first_register_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import '../../../../../core/utils/routes_config/routes_config.dart';

class FirstRegisterView extends StatelessWidget {
  const FirstRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pushReplacement(RoutesConfig.authOptions);
      },
      child: const SafeArea(
        child: Scaffold(
          appBar: AuthAppBar(),
          body: FirstRegisterViewBody(),
        ),
      ),
    );
  }
}
