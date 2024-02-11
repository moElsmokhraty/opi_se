import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_view_body.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../domain/use_cases/get_partner_recommendations_use_case.dart';
import '../../../domain/use_cases/send_partner_request_use_case.dart';
import '../../cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PartnerRecommendationsCubit>(
      create: (context) => PartnerRecommendationsCubit(
        getIt.get<GetPartnerRecommendationsUseCase>(),
        getIt.get<SendPartnerRequestsUseCase>(),
      )..getPartnerRecommendations(),
      child: const SafeArea(
        child: Scaffold(
          appBar: HomeAppBar(),
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
