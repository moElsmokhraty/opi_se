import 'edit_bio_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/styling/styles.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        bottom: 20.h,
        top: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About me',
                style: AppStyles.textStyle24.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const EditBioDialog(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    color: const Color(0xff036666),
                    Icons.edit_outlined,
                    size: 26.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            userCache?.bio ?? 'No bio available',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
