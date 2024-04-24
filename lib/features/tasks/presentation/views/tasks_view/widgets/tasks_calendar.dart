import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/tasks/presentation/cubits/tasks_cubit/tasks_cubit.dart';

class TasksCalendar extends StatelessWidget {
  const TasksCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    final EasyInfiniteDateTimelineController calendarController =
        EasyInfiniteDateTimelineController();
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return EasyInfiniteDateTimeLine(
          controller: calendarController,
          firstDate: DateTime(2023),
          selectionMode: const SelectionMode.autoCenter(),
          dayProps: EasyDayProps(
            height: 65.h,
            width: 65.w,
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: const Color(0XFF036666),
                borderRadius: BorderRadius.circular(10.r),
              ),
              dayNumStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              dayStrStyle: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: const Color(0XFFF5F5F5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              dayNumStyle: TextStyle(
                color: const Color(0XFF036666),
                fontSize: (19.5).sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              dayStrStyle: TextStyle(
                color: const Color(0XFF036666),
                fontSize: (9.5).sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            todayStyle: DayStyle(
              decoration: BoxDecoration(
                color: const Color(0XFF036666).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              dayNumStyle: TextStyle(
                color: Colors.white,
                fontSize: (19.5).sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              dayStrStyle: TextStyle(
                color: Colors.white,
                fontSize: (9.5).sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
          ),
          showTimelineHeader: false,
          activeColor: const Color(0XFF036666),
          focusDate: cubit.focusDate,
          lastDate: DateTime(2028),
          onDateChange: (selectedDate) {
            calendarController.animateToDate(selectedDate);
            cubit.changeFocusDate(selectedDate);
          },
        );
      },
    );
  }
}
