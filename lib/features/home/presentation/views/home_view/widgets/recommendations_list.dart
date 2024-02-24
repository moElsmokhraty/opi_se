import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'recommendation_item.dart';
import '../../../cubits/partner_recommendations_cubit/partner_recommendations_cubit.dart';

class RecommendationsList extends StatelessWidget {
  const RecommendationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final PartnerRecommendationsCubit cubit = BlocProvider.of(context);
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getPartnerRecommendations();
      },
      child: BlocConsumer<PartnerRecommendationsCubit,
          PartnerRecommendationsState>(
        listener: (context, state) async {
          if (state is GetPartnerRecommendationsFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          } else if (state is SendPartnerRequestFailure) {
            if (state.failure.errMessage == 'unable to send notification !' ||
                state.failure.errMessage == 'unexpected error !') {
              showCustomSnackBar(
                context,
                'Request sent but unable to send notification !',
              );
            } else {
              showCustomSnackBar(context, state.failure.errMessage);
            }
            await cubit.getPartnerRecommendations();
          } else if (state is SendPartnerRequestSuccess) {
            showCustomSnackBar(context, 'Request sent successfully');
            await cubit.getPartnerRecommendations();
          } else if (state is SendPartnerRequestLoading) {
            showCustomSnackBar(context, 'Sending request...');
          }
        },
        builder: (context, state) {
          if (state is GetPartnerRecommendationsLoading &&
              cubit.recommendations.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF036666)),
            );
          } else if (state is GetPartnerRecommendationsFailure) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_requests.png',
                    width: double.infinity,
                    height: 350.h,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'No Requests Found',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    state.failure.errMessage,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            );
          } else {
            if (cubit.recommendations.isEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/no_requests.png',
                      width: double.infinity,
                      height: 350.h,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'No Recommendations Found',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'You don\'t have recommendations yet.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 20.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.recommendations.length,
              itemBuilder: (context, index) => RecommendationItem(
                userData: cubit.recommendations[index],
              ),
            );
          }
        },
      ),
    );
  }
}
