import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/verify_account_view/widgets/verify_account_view_body.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: VerifyAccountViewBody(),
      ),
    );
  }
}
