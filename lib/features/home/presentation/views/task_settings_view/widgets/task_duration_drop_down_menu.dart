import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDurationDropDownMenu extends StatelessWidget {
  const TaskDurationDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: DropdownMenu(
        controller: TextEditingController(),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14.sp,
        ),
        hintText: 'Select',
        width: 0.4.sw,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
          ),
        ),
        menuStyle: MenuStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 8.h),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        menuHeight: 200.h,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 10, label: '10 Min'),
          DropdownMenuEntry(value: 20, label: '20 Min'),
          DropdownMenuEntry(value: 30, label: '30 Min'),
        ],
        onSelected: (value) {
          //cubit.editExperienceEmploymentTypeController.text = value.toString();
        },
      ),
    );
  }
}
