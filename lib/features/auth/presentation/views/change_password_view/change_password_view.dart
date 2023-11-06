import 'package:flutter/material.dart';
import 'widgets/change_password_view_body.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthAppBar(),
      body: ChangePasswordViewBody(),
    );
  }
}
