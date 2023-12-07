import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/question_page.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/user_prefers_page.dart';

class UserPrefersViewBody extends StatelessWidget {
  const UserPrefersViewBody({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    UserPrefersCubit cubit = BlocProvider.of<UserPrefersCubit>(context);
    return BlocBuilder<UserPrefersCubit, UserPrefersState>(
      builder: (context, state) {
        return PageView(
          controller: cubit.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            UserPrefersPage(cubit: cubit),
            QuestionPage(
              index: 0,
              question: cubit.questions[0],
              cubit: cubit,
            ),
            QuestionPage(
              index: 1,
              question: cubit.questions[1],
              cubit: cubit,
            ),
            QuestionPage(
              index: 2,
              question: cubit.questions[2],
              cubit: cubit,
            ),
            QuestionPage(
              index: 3,
              question: cubit.questions[3],
              cubit: cubit,
            ),
          ],
        );
      },
    );
  }
}
