import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/verify_account_view/widgets/verify_account_view_body.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AuthAppBar(),
        body: VerifyAccountViewBody(email: email),
      ),
    );
  }
}
