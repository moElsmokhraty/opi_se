import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourMentorsGridView extends StatelessWidget {
  const YourMentorsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 1,
        mainAxisExtent: 120.h,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 75.h,
              width: 75.w,
              decoration: const BoxDecoration(
                color: Color(0XFFEDEBDE),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/man.png'),
            ),
            SizedBox(height: 12.h),
            Text(
              'Mohamed Ali',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Inter',
              ),
            ),
          ],
        );
      },
    );
  }
}
