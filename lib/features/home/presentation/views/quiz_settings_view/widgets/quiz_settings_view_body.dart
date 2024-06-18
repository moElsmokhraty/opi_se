import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'duration_drop_down_menu.dart';
import 'quiz_visibility_drop_down_menu.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class QuizSettingsViewBody extends StatelessWidget {
  const QuizSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            height: 230.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75.w,
                  height: 75.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0XFF036666),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/quiz_settings.png',
                    height: 45.h,
                    width: 45.w,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Upload cover image',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          Text(
            'Name',
            style: TextStyle(
              fontSize: 21.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: height * 0.01),
          AuthTextField(
            hintText: 'Enter quiz name',
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: height * 0.04),
          Text(
            'Subject',
            style: TextStyle(
              fontSize: 21.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: height * 0.01),
          AuthTextField(
            hintText: 'Enter quiz Subject',
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: height * 0.04),
          Text(
            'Visibility',
            style: TextStyle(
              fontSize: 21.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: height * 0.01),
          const QuizVisibilityDropDownMenu(),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  const DurationDropDownMenu(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deadline',
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: 0.4.sw,
                    child: AuthTextField(
                      readOnly: true,
                      hintText: 'Select start date',
                      controller: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.06),
          AuthButton(
            backColor: const Color(0XFF036666),
            textColor: Colors.white,
            text: 'Publish',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
