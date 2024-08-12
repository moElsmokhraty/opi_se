import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/mental_health/domain/use_cases/get_mental_support_use_case.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../cubits/mental_health_cubit.dart';
import 'widgets/first_page.dart';
import 'widgets/intro_page.dart';
import 'widgets/result_page.dart';
import 'widgets/second_page.dart';
import 'widgets/third_page.dart';

class MentalHealthView extends StatelessWidget {
  const MentalHealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) {
          return MentalHealthCubit(getIt.get<GetMentalSupportUseCase>());
        },
        child: BlocBuilder<MentalHealthCubit, MentalHealthState>(
          builder: (context, state) {
            final MentalHealthCubit cubit =
                BlocProvider.of<MentalHealthCubit>(context);
            return PopScope(
              canPop: false,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: cubit.pageController,
                children: const [
                  IntroPage(),
                  FirstPage(),
                  SecondPage(),
                  ThirdPage(),
                  ResultPage(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
