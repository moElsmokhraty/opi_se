import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/register_label.dart';

import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class ThirdRegisterViewBody extends StatelessWidget {
  const ThirdRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegisterLabel(),
          SizedBox(height: screenHeight * 0.05),
          Text(
            'Field of Study',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          AuthTextField(
            controller: TextEditingController(),
            hintText: 'Enter Your Field of Study',
            prefixIcon: Icon(
              CupertinoIcons.book_circle,
              size: 21.sp,
              color: const Color(0xff036666),
            ),
            validator: (value) {
              return validateText('Field of Study', value!);
            },
          ),
          SizedBox(height: screenHeight * 0.025),
          Text(
            'Specialization',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          AuthTextField(
            controller: TextEditingController(),
            hintText: 'Enter Your Specialization',
            prefixIcon: Icon(
              Icons.computer_outlined,
              size: 21.sp,
              color: const Color(0xff036666),
            ),
            validator: (value) {
              return validateText('Specialization', value!);
            },
          ),
          SizedBox(height: screenHeight * 0.025),
          Text(
            'Skills',
            style: AppStyles.textStyle16.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          AuthTextField(
            controller: TextEditingController(),
            hintText: 'Enter Your Skills',
            prefixIcon: Icon(
              CupertinoIcons.square_stack_3d_up,
              size: 21.sp,
              color: const Color(0xff036666),
            ),
            validator: (value) {
              return validateText('Skills', value!);
            },
          ),
          SizedBox(height: screenHeight * 0.04),
          AuthButton(
            text: 'Sign Up',
            onPressed: () {},
            backColor: const Color(0xff036666),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
