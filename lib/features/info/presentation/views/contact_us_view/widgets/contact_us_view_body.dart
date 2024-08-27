import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/app_assets.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                AppAssets.contactUs,
                width: double.infinity,
                height: 275.h,
              ),
              Column(
                children: [
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      tooltip: 'Back',
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.only(left: 20.w),
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFF036666),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Use this form to reach out to our team regarding any questions, concerns, or feedback.',
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF036666),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Fill out the form bellow, and we ’ll get back to you as early as possible.',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 10.h),
                AuthTextField(
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  hintText: 'Enter your name',
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 10.h),
                AuthTextField(
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  hintText: 'Enter your email',
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Message',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 10.h),
                AuthTextField(
                  controller: TextEditingController(),
                  maxLines: 5,
                  minLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  hintText: 'Enter your message',
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(140.w, 50.h),
                    backgroundColor: const Color(0XFF036666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.contactUsFooter,
                    width: 300.w,
                    height: 300.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.05),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      height: 55.h,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFF036666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'graduation.project.info@gmail.com ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    children: [
                      TextSpan(
                        text: ' all rights reserved.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF036666),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
