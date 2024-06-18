import 'package:flutter/material.dart';
import 'widgets/mentor_home_app_bar.dart';
import 'widgets/mentor_home_view_body.dart';

class MentorHomeView extends StatelessWidget {
  const MentorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        appBar: MentorHomeAppBar(),
        body: SafeArea(
          child: MentorHomeViewBody(),
        ),
      ),
    );
  }
}
