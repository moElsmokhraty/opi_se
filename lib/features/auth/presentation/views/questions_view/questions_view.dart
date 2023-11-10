import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/widgets/questions_view_body.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: QuestionsViewBody(),
      ),
    );
  }
}
