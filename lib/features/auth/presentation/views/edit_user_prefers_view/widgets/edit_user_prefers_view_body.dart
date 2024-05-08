import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import '../../../cubits/edit_user_prefers_cubit/edit_user_prefers_cubit.dart';
import 'finish_button.dart';
import 'level_slider.dart';
import 'skills_widget.dart';

class EditUserPrefersViewBody extends StatelessWidget {
  const EditUserPrefersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    EditUserPrefersCubit cubit = BlocProvider.of<EditUserPrefersCubit>(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit your academic and skills details to enhance your Study Partner experience !',
              maxLines: 5,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              'Field of Study',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            AuthTextField(
              controller: cubit.fieldOfStudyController,
              hintText: 'Enter Your Field of Study',
              prefixIcon: Icon(
                CupertinoIcons.book_circle,
                size: 21.sp,
                color: const Color(0xff036666),
              ),
              validator: (value) {
                return validateText('Field of Study', value!);
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Specialization',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            AuthTextField(
              controller: cubit.specializationController,
              hintText: 'Enter Your Specialization',
              prefixIcon: Icon(
                Icons.computer_outlined,
                size: 21.sp,
                color: const Color(0xff036666),
              ),
              validator: (value) {
                return validateText('Specialization', value!);
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Skills',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            const SkillsWidget(),
            SizedBox(height: screenHeight * 0.01),
            const LevelSlider(),
            SizedBox(height: screenHeight * 0.025),
            const FinishButton(),
          ],
        ),
      ),
    );
  }
}
