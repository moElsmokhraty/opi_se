import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/contact_us_view_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        body: SafeArea(
          child: ContactUsViewBody(),
        ),
      ),
    );
  }
}
