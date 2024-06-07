import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../cubits/mentor_register/mentor_register_cubit.dart';

class MentorGenderWidget extends StatelessWidget {
  const MentorGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MentorRegisterCubit cubit = BlocProvider.of<MentorRegisterCubit>(context);
    return SizedBox(
      height: 55.h,
      child: DropdownMenu(
        controller: cubit.genderController,
        textStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14.sp,
        ),
        hintText: 'Select',
        width: width * 0.875,
        leadingIcon: Icon(
          Icons.transgender_outlined,
          size: 21.sp,
          color: const Color(0xff036666),
        ),
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
          DropdownMenuEntry(value: 'Male', label: 'Male'),
          DropdownMenuEntry(value: 'Female', label: 'Female'),
        ],
        onSelected: (value) {
          cubit.genderController.text = value.toString();
        },
        initialSelection: 'Male',
      ),
    );
  }
}
