import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/styling/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    final List<String> skills = ['Dart', 'Flutter', 'OOP', 'Java', 'C++'];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
              Positioned(
                bottom: 10.h,
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
                      ),
                      child: CircleAvatar(
                        radius: 65.r,
                        backgroundColor:
                            const Color(0xff366666).withOpacity(0.2),
                        child: Text('MS',
                            style: AppStyles.textStyle16
                                .copyWith(fontSize: 30.sp)),
                      ),
                    ),
                    Positioned(
                      bottom: 25.h,
                      right: 15.w,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: const Color(0xff036666),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Mohamed Elsmokhraty',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 25.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            'Flutter Developer',
            style: AppStyles.textStyle16.copyWith(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            '21 Years',
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
          SizedBox(height: screenHeight * 0.05),
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Text(
                    'Id:',
                    style: AppStyles.textStyle24.copyWith(
                      fontSize: 18.sp,
                      height: 0.08,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'https://smokhraty27/opise.com',
                    style: AppStyles.textStyle12.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                      height: 0.15,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.095),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: 'lol'));
                      showCustomSnackBar(context, 'Copied to clipboard');
                    },
                    child: Icon(
                      Icons.copy_rounded,
                      color: Colors.black.withOpacity(0.7),
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            padding: EdgeInsets.only(
                left: 12.w, right: 12.w, bottom: 20.h, top: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About me',
                      style: AppStyles.textStyle24.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 26.sp,
                        ),
                        color: const Color(0xff036666),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, Lorem Ipsum has been the  industry\'s standard dummy text ever.',
                  style: AppStyles.textStyle12.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skills',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: skills.map((skill) {
                    return Chip(
                      backgroundColor: const Color(0xFFF6F6F6),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF036666)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      label: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 4.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              skill,
                              style: AppStyles.textStyle24
                                  .copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              '3',
                              style: AppStyles.textStyle24
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
