import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMediaViewBody extends StatelessWidget {
  const ChatMediaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/avatar_image.png',
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Nada Abdelnasser',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 45.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    CupertinoIcons.video_camera,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 24.h),
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Media',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF036666),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 3.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFF036666),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: GridView.builder(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/avatar_image.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
