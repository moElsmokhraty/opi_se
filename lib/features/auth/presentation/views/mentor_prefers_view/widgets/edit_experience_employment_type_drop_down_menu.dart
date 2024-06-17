import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class EditExperienceEmploymentTypeDropDownMenu extends StatelessWidget {
  const EditExperienceEmploymentTypeDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MentorPrefersCubit>(context);
    return SizedBox(
      height: 55.h,
      child: DropdownMenu(
        controller: cubit.editExperienceEmploymentTypeController,
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14.sp,
        ),
        hintText: 'Select',
        width: width * 0.78,
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
          DropdownMenuEntry(value: 'Full-Time', label: 'Full-Time'),
          DropdownMenuEntry(value: 'Part-Time', label: 'Part-Time'),
        ],
        onSelected: (value) {
          cubit.editExperienceEmploymentTypeController.text = value.toString();
        },
      ),
    );
  }
}
