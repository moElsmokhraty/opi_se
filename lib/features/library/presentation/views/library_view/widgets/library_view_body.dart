import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'empty_library_widget.dart';

class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  margin: EdgeInsets.only(top: screenHeight * 0.05, right: 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0.r),
                      topRight: Radius.circular(0.r),
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Published',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: const Color(0xFF366666),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 90.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF366666),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  margin: EdgeInsets.only(top: screenHeight * 0.05, left: 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      topLeft: Radius.circular(0.r),
                      bottomLeft: Radius.circular(0.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Drafts',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: const Color(0xFF366666),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 80.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF366666),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const EmptyLibraryWidget(text: 'Quizzes'),
        ],
      ),
    );
  }
}
