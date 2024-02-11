import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/user_cache.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/question_page.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/user_prefers_page.dart';

class UserPrefersViewBody extends StatelessWidget {
  const UserPrefersViewBody({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    UserPrefersCubit cubit = BlocProvider.of<UserPrefersCubit>(context);
    return BlocConsumer<UserPrefersCubit, UserPrefersState>(
      listener: (context, state) {
        if (state is SubmitUserPrefersSuccess) {
          userCache!.getUserPrefers = false;
          Hive.box<UserCache>(boxName).put('user', userCache!);
          userCache = Hive.box<UserCache>(boxName).get('user');
          GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
          showCustomSnackBar(context, 'User Prefers submitted successfully!');
        } else if (state is SubmitUserPrefersFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return PageView(
          controller: cubit.pageController,
          physics: const BouncingScrollPhysics(),
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
