import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'experiences_widget.dart';
import 'mentor_finish_button.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '4/4 to create your profile',
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Text(
            'We need to get a sense of your education, experience. it’s quickest to import your information.',
            maxLines: 6,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          const ExperiencesWidget(),
          SizedBox(height: screenHeight * 0.025),
          const MentorFinishButton(),
        ],
      ),
    );
  }
}
