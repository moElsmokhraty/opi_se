import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/widgets/app_bars/auth_app_bar.dart';
import 'widgets/auth_options_view_view_body.dart';

class AuthOptionsView extends StatelessWidget {
  const AuthOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (canPop) {
        SystemNavigator.pop();
      },
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AuthAppBar(),
          body: AuthOptionsViewBody(),
        ),
      ),
    );
  }
}
