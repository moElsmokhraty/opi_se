import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'widgets/mentor_prefers_view_body.dart';

class MentorPrefersView extends StatelessWidget {
  const MentorPrefersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AuthAppBar(hasBackButton: false),
        body: SafeArea(
          child: MentorPrefersViewBody(),
        ),
      ),
    );
  }
}
