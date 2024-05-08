import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'leaderboard_dialog.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const LeaderboardDialog(),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Show more',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5.w),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
