import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/mental_health/presentation/cubits/mental_health_cubit.dart';

import '../../../../../../../core/utils/styling/styles.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<MentalHealthCubit, MentalHealthState>(
      builder: (context, state) {
        final MentalHealthCubit cubit =
            BlocProvider.of<MentalHealthCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2.  What is your gender?',
              style: AppStyles.textStyle22,
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    cubit.setGender(true);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 82.w,
                    height: 72.h,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (cubit.isMale == null)
                          ? const Color(0XFFF6F6F6)
                          : cubit.isMale!
                              ? const Color(0xFF036666).withOpacity(0.25)
                              : const Color(0XFFF6F6F6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: (cubit.isMale == null)
                            ? Colors.black
                            : cubit.isMale!
                                ? const Color(0xFF036666)
                                : Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 4.w,
                  height: 72.h,
                  color: Colors.black.withOpacity(0.1),
                ),
                GestureDetector(
                  onTap: () {
                    cubit.setGender(false);
                  },
                  child: Container(
                    width: 82.w,
                    height: 72.h,
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (cubit.isMale == null)
                          ? const Color(0XFFF6F6F6)
                          : cubit.isMale!
                              ? const Color(0XFFF6F6F6)
                              : const Color(0xFF036666).withOpacity(0.25),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Female',
                      style: TextStyle(
                        color: (cubit.isMale == null)
                            ? Colors.black
                            : cubit.isMale!
                                ? Colors.black
                                : const Color(0xFF036666),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
