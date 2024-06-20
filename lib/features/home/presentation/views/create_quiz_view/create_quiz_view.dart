import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/create_quiz_app_bar.dart';
import 'widgets/create_quiz_view_body.dart';

class CreateQuizView extends StatelessWidget {
  const CreateQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) async {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: CreateQuizAppBar(),
        body: CreateQuizViewBody(),
      ),
    );
  }
}
