import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'your_mentors_grid_view.dart';
import 'search_mentor_text_field.dart';
import 'search_mentor_results_list.dart';

class SearchMentorViewBody extends StatelessWidget {
  const SearchMentorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search for the Perfect Mentor',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              const SearchMentorTextField(),
              SizedBox(height: screenHeight * 0.06),
              Text(
                'Your Mentors',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              const YourMentorsGridView(),
              Text(
                'No mentors yet! Start Search by topic or tags to get your mentors',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        const SearchMentorResultsList(),
      ],
    );
  }
}
