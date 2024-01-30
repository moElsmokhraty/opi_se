import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/home/presentation/cubits/match_requests_cubit/match_requests_cubit.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.cubit,
    required this.state,
    required this.requestId,
  });

  final MatchRequestsCubit cubit;
  final MatchRequestsState state;
  final String requestId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xff366666).withOpacity(0.4),
                        const Color(0xff366666).withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 12.w,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.black.withOpacity(0.7),
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 75.h),
          ],
        ),
        Positioned(
          bottom: 11.h,
          left: 11.w,
          child: Stack(
            children: [
              Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8.w,
                  ),
                  color: const Color(0XFF9AC2C2), //by abdelaziz wal3ana
                ),
                child: CircleAvatar(
                  radius: 65.r,
                  backgroundColor: const Color(0XFF9AC2C2),
                  child: Text(
                    'MS',
                    style: AppStyles.textStyle16.copyWith(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 15.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 4.w,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 0.w,
          child: Row(
            children: [
              state is AcceptMatchRequestLoading
                  ? SizedBox(
                      width: 70.w,
                      child: const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF036666)),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        await cubit.acceptMatchRequest(
                          cubit.userData?.id ?? '',
                          cubit.userData?.nationalId ?? '',
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(70.w, 30.h),
                        backgroundColor: const Color(0xFF036666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
              SizedBox(width: 14.w),
              state is DeclineMatchRequestLoading
                  ? SizedBox(
                      width: 70.w,
                      child: const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF036666)),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        await cubit.declineMatchRequest(
                          DeclineMatchRequest(
                            email: cubit.userData?.email ?? '',
                            requestId: requestId,
                            rejectedUserId: cubit.userData?.id ?? '',
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(70.w, 30.h),
                        backgroundColor: const Color(0xFFEDEDED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Decline',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
