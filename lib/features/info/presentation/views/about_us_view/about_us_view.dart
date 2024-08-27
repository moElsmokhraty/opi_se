import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        body: SafeArea(
          child: AboutUsViewBody(),
        ),
      ),
    );
  }
}
