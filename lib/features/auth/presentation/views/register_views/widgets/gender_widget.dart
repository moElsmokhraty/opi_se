import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../cubits/register_cubit/register_cubit.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return SizedBox(
      height: 75.h,
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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
          ),
        ),
        menuStyle: MenuStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 8.h),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(4.sp),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp),
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
