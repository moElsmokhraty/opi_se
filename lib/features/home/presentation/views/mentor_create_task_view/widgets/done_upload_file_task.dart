import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoneUploadFileTask extends StatelessWidget {
  const DoneUploadFileTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Question',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: const Color(0XFF036666),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    Icons.copy_outlined,
                    color: Colors.black.withOpacity(0.7),
                    size: 14.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.trash,
                    color: Colors.black.withOpacity(0.7),
                    size: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  minLines: 3,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: 'Type your question here',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.black.withOpacity(0.4),
                    ),
                    border: null,
                    focusedBorder: null,
                    focusColor: null,
                    enabledBorder: null,
                  ),
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                SizedBox(height: 10.h),
                Image.asset(
                  'assets/images/mentor.png',
                  width: 100.w,
                  height: 100.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
