import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'user_container.dart';
import 'custom_call_button.dart';

class CallViewBody extends StatelessWidget {
  const CallViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 625.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/call.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                right: 16.w,
                child: CustomCallButton(
                  icon: Icons.mic_off,
                  onPressed: () {},
                ),
              ),
              const UserContainer(),
            ],
          ),
        ),
        Positioned(
          bottom: 24.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCallButton(
                  icon: Icons.mic_off,
                  onPressed: () {},
                ),
                CustomCallButton(
                  icon: Icons.videocam_outlined,
                  onPressed: () {},
                ),
                CustomCallButton(
                  icon: Icons.call_end,
                  onPressed: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 26.w),
                          backgroundColor: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 16.h),
                              Text(
                                'Meeting Review',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Divider(
                                height: 0,
                                thickness: 1,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'How was your experience studying with Nada?',
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle24.copyWith(
                                  fontSize: 16.sp,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  buttonColor: Colors.red,
                  iconColor: Colors.white,
                  shape: const OvalBorder(),
                ),
                CustomCallButton(
                  icon: Icons.message_outlined,
                  onPressed: () {},
                ),
                CustomCallButton(
                  icon: Icons.more_vert,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
