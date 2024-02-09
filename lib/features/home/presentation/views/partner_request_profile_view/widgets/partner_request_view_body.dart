import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../profile_view/widgets/about_me_widget.dart';
import '../../profile_view/widgets/header_widget.dart';
import '../../profile_view/widgets/id_widget.dart';
import 'package:opi_se/features/home/presentation/cubits/match_requests_cubit/match_requests_cubit.dart';

class PartnerRequestViewBody extends StatelessWidget {
  const PartnerRequestViewBody({super.key, required this.requestId});

  final String requestId;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    MatchRequestsCubit cubit = BlocProvider.of<MatchRequestsCubit>(context);
    return BlocConsumer<MatchRequestsCubit, MatchRequestsState>(
      listener: (context, state) {
        if (state is AcceptMatchRequestFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is DeclineMatchRequestFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is AcceptMatchRequestSuccess) {
          GoRouter.of(context).pushReplacementNamed(RoutesConfig.requests);
          showCustomSnackBar(context, 'Request Accepted Successfully');
        } else if (state is DeclineMatchRequestSuccess) {
          GoRouter.of(context).pushReplacementNamed(RoutesConfig.requests);
          showCustomSnackBar(context, 'Request Declined Successfully');
        }
      },
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProfileFailure) {
          return Center(
            child: Text(state.failure.errMessage),
          );
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  cubit: cubit,
                  state: state,
                  requestId: requestId,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  cubit.userData?.userName ?? 'Unknown',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 25.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  cubit.userData?.email ?? 'Unknown',
                  style: AppStyles.textStyle16.copyWith(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  cubit.userData?.age.toString() ?? 'Unknown' ' Years',
                  style: AppStyles.textStyle16.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Damanhour, Egypt',
                  style: AppStyles.textStyle16.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                const IDWidget(),
                SizedBox(height: screenHeight * 0.025),
                const AboutMeWidget(),
                SizedBox(height: screenHeight * 0.025),
                //const ProfileSkillsWidget(),
              ],
            ),
          );
        }
      },
    );
  }
}
