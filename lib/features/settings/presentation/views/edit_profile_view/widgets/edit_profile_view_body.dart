import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/validate_email.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';
import '../../../../../../core/utils/styling/styles.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 22.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666).withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                ),
                Positioned(
                  bottom: 7.h,
                  right: 3.w,
                  child: Container(
                    height: 18.h,
                    width: 18.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0XFF036666),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6.r),
                        topRight: Radius.circular(6.r),
                        topLeft: Radius.circular(6.r),
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 12.sp,
                    )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Username',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          AuthTextField(
            controller: TextEditingController(text: 'John'),
            hintText: '',
            validator: (value) {
              return validateText('UserName', value!);
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Email',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          AuthTextField(
            controller: TextEditingController(text: ' '),
            hintText: '',
            validator: (value) {
              return validateEmail(value!);
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Phone Number',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          AuthTextField(
            controller: TextEditingController(text: ' '),
            hintText: '',
            validator: (value) {
              return validateText('UserName', value!);
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Address',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          AuthTextField(
            controller: TextEditingController(text: ' '),
            hintText: '',
            validator: (value) {
              return validateText('UserName', value!);
            },
          ),
        ],
      ),
    );
  }
}
