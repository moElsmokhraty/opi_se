import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'home_page.dart';
import 'recommendations_list.dart';
import '../../../cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final PartnerRecommendationsCubit cubit = BlocProvider.of(context);
    return PageView(
      physics: userCache!.matchId == null
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: cubit.pageController,
      children: const [
        HomePage(),
        RecommendationsList(),
      ],
    );
  }
}
