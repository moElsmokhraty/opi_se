import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';
import 'edit_experience_employment_type_drop_down_menu.dart';

class EditExperienceDialog extends StatelessWidget {
  const EditExperienceDialog({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MentorPrefersCubit>(context);
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit Experience',
              style: TextStyle(
                color: const Color(0xFF036666),
                fontSize: 22.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Title',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            AuthTextField(
              controller: cubit.editExperienceTitleController,
              hintText: 'Title',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title cannot be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            Text(
              'Employment Type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            const EditExperienceEmploymentTypeDropDownMenu(),
            SizedBox(height: 10.h),
            Text(
              'Company Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            AuthTextField(
              controller: cubit.editExperienceCompanyNameController,
              hintText: 'Company Name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Company Name cannot be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                BlocBuilder<MentorPrefersCubit, MentorPrefersState>(
                  builder: (context, state) {
                    return Checkbox(
                      activeColor: const Color(0xFF036666),
                      value: cubit.editExperienceIsCurrentlyWorking,
                      onChanged: (value) {
                        cubit.toggleEditExperienceIsCurrentlyWorking();
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    'I am currently working in this role',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Start Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            AuthTextField(
              controller: cubit.editExperienceStartDateController,
              hintText: 'Start Date',
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Start Date cannot be empty';
                }
                return null;
              },
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
              },
            ),
            SizedBox(height: 10.h),
            Text(
              'End Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            AuthTextField(
              controller: cubit.editExperienceEndDateController,
              hintText: 'End Date',
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Start Date cannot be empty';
                }
                return null;
              },
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
              },
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                cubit.deleteExperience(index);
                Navigator.pop(context);
              },
              child: Text(
                'Delete Experience',
                style: TextStyle(
                  color: const Color(0XFF036666),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      side: const BorderSide(
                        color: Color(0XFF036666),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                ElevatedButton(
                  onPressed: () async {
                    await cubit.editExperience(index).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF036666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
