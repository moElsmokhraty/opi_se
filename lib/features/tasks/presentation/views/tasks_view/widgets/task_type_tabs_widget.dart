import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/tasks_cubit/tasks_cubit.dart';

class TaskTypeTabsWidget extends StatelessWidget {
  const TaskTypeTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
        int index = cubit.selectedIndex;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: const Color(0XFFF5F5F5),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => cubit.changeSelectedIndex(0),
                child: SizedBox(
                  width: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: index == 0,
                            child: Container(
                              height: 5.w,
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
                              color: index == 0
                                  ? const Color(0XFF8724D3)
                                  : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Visibility(
                        visible: index == 0,
                        child: Container(
                          height: 5.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFF8724D3),
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => cubit.changeSelectedIndex(1),
                child: SizedBox(
                  width: 110.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: index == 1,
                            child: Container(
                              height: 5.w,
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
                              color: index == 1
                                  ? const Color(0XFFFF7A00)
                                  : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Visibility(
                        visible: index == 1,
                        child: Container(
                          height: 5.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            color: const Color(0XFFFF7A00),
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => cubit.changeSelectedIndex(2),
                child: SizedBox(
                  width: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: index == 2,
                            child: Container(
                              height: 5.w,
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
                              color: index == 2
                                  ? const Color(0XFF00B81D)
                                  : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Visibility(
                        visible: index == 2,
                        child: Container(
                          height: 5.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFF00B81D),
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
