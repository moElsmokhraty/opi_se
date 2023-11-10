import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/first_register_view_body.dart';

class FirstRegisterView extends StatelessWidget {
  const FirstRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: FirstRegisterViewBody(),
      ),
    );
  }
}
