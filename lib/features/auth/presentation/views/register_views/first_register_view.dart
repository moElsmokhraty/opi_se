import 'package:flutter/material.dart';
import 'widgets/first_register_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';

class FirstRegisterView extends StatelessWidget {
  const FirstRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AuthAppBar(),
          body: FirstRegisterViewBody(),
        ),
      ),
    );
  }
}
