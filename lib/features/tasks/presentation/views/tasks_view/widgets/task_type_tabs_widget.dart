import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTypeTabsWidget extends StatelessWidget {
  const TaskTypeTabsWidget({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TabBar(
        splashBorderRadius: BorderRadius.circular(20.r),
        tabAlignment: TabAlignment.center,
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorColor: tabController.index == 0
            ? const Color(0XFF8724D3)
            : tabController.index == 1
                ? const Color(0XFFFF7A00)
                : const Color(0XFF00B81D),
        tabs: [
          Tab(
            child: Row(
              children: [
                Visibility(
                  visible: tabController.index == 0,
                  child: Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                      color: Color(0XFF8724D3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'To do',
                  style: TextStyle(
                    color: tabController.index == 0
                        ? const Color(0XFF8724D3)
                        : Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Visibility(
                  visible: tabController.index == 1,
                  child: Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                      color: Color(0XFFFF7A00),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'In Progress',
                  style: TextStyle(
                    color: tabController.index == 1
                        ? const Color(0XFFFF7A00)
                        : Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Visibility(
                  visible: tabController.index == 2,
                  child: Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                      color: Color(0XFF00B81D),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Done',
                  style: TextStyle(
                    color: tabController.index == 2
                        ? const Color(0XFF00B81D)
                        : Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
