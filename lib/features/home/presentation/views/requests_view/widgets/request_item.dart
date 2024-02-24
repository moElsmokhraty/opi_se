import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import '../../../../data/models/requests_models/get_match_requests_response/partner_request.dart';
import 'package:opi_se/features/home/presentation/cubits/match_requests_cubit/match_requests_cubit.dart';
import '../../../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({
    super.key,
    this.partnerRequest,
    required this.cubit,
  });

  final PartnerRequest? partnerRequest;
  final MatchRequestsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatchRequestsCubit, MatchRequestsState>(
      listener: (context, state) async {
        if (state is AcceptMatchRequestSuccess) {
          cubit.emitAcceptPartnerRequest(
            notifiedPartner: state.response.notifiedPartner!,
            matchId: state.response.matchId!,
            partnerUserName: partnerRequest!.partnerUserName!,
          );
          showCustomSnackBar(context, 'Request accepted successfully');
          await cubit.getMatchRequests();
        }
      },
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushReplacementNamed(
            RoutesConfig.partnerRequestProfile,
            extra: partnerRequest,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/avatar_image.png',
              height: 70.h,
              width: 70.w,
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                SizedBox(
                  width: 250.w,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: partnerRequest?.partnerUserName ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' sent you add request',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        await cubit.acceptMatchRequest(
                          partnerRequest?.partnerId ?? '',
                          partnerRequest?.nationalId ?? '',
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(100.w, 30.h),
                        backgroundColor: const Color(0xFF036666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    TextButton(
                      onPressed: () async {
                        await cubit.declineMatchRequest(
                          DeclineMatchRequest(
                            email: 'moelsmokhraty@gmail.com',
                            requestId: partnerRequest?.id ?? '',
                            rejectedUserId: partnerRequest?.partnerId ?? '',
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(100.w, 30.h),
                        backgroundColor: const Color(0xFFEDEDED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Decline',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
