import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'recommendation_item.dart';
import '../../../cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';

class RecommendationsList extends StatelessWidget {
  const RecommendationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final PartnerRecommendationsCubit cubit = BlocProvider.of(context);
    return BlocBuilder<PartnerRecommendationsCubit,
        PartnerRecommendationsState>(
      builder: (context, state) {
        if (state is GetPartnerRecommendationsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF036666)),
          );
        } else if (state is GetPartnerRecommendationsFailure) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Text(
                state.failure.errMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => RecommendationItem(
              userData: cubit.recommendations[index],
            ),
          );
        }
      },
    );
  }
}
