import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/auth/presentation/cubits/questions_cubit/questions_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/questions_view/widgets/question_page.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionsCubit cubit = BlocProvider.of<QuestionsCubit>(context);
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        return PageView(
          controller: cubit.pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            QuestionPage(
              index: 0,
              question: 'Do you have Depression ?',
              cubit: cubit,
            ),
            QuestionPage(
              index: 1,
              question: 'Do you have Anxiety ?',
              cubit: cubit,
            ),
            QuestionPage(
              index: 2,
              question: 'Do you have Panic attack ?',
              cubit: cubit,
            ),
            QuestionPage(
              index: 3,
              question: 'Did you seek any specialist for a treatment ?',
              cubit: cubit,
            ),
          ],
        );
      },
    );
  }
}
