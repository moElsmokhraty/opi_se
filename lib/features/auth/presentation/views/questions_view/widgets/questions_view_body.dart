import 'package:flutter/material.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/widgets/question_page.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        QuestionPage(),
        QuestionPage(),
      ]
    );
  }
}
