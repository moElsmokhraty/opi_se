import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Mental Health',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.h, top: 20.h),
        child: Container(
          height: 620.h,
          width: screenWidth,
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, -3),
                ),
              ],
              color: const Color(0XFFEDEBDE).withOpacity(0.8)),
          child: Column(
            children: [
              Text(
                'Your Mental Health Score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 23.sp,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              CircularPercentIndicator(
                radius: 100.w,
                lineWidth: 20.w,
                animation: true,
                percent: 0.7,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xFF036666),
                center: Text(
                  "70%",
                  style: TextStyle(
                    color: const Color(0xFF036666),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Suggestions for you:',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 27.sp,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Text(
                      '1.  How would you describe your feeling at School University work in the best few days?',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              AuthButton(
                text: 'Start a New Test',
                backColor: const Color(0xFF036666),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
