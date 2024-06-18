import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'create_quiz_or_task_dialog.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';

class MentorHomeViewBody extends StatelessWidget {
  const MentorHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.025),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'With',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' Opi Se ',
                  style: AppStyles.textStyle24.copyWith(
                    color: const Color(0xFF036666),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'You Can Create Quizzes and Tasks for your Students',
                  style: AppStyles.textStyle24.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Welcome to our learning community! Step into a world of opportunity at Opi Se where learning is a shared journey. Start exploring, connecting, and achieving your academic goals.',
            style: AppStyles.textStyle24.copyWith(
              fontSize: 15.sp,
              color: Colors.black.withOpacity(0.6),
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          AuthButton(
            text: '+   Start Create',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateQuizOrTaskDialog(),
              );
            },
            backColor: const Color(0xFF036666),
            textColor: Colors.white,
          ),
          Image.asset(
            'assets/images/home_asset.png',
            width: double.infinity,
            height: 250.h,
          ),
        ],
      ),
    );
  }
}
