import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/buttons/next_button.dart';
import 'mentor_level_slider.dart';
import 'mentor_skills_widget.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class PrefersPage extends StatelessWidget {
  const PrefersPage({super.key});

  @override
  Widget build(BuildContext context) {
    MentorPrefersCubit cubit = BlocProvider.of<MentorPrefersCubit>(context);
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
              '1/4 to create your profile',
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Text(
              'Complete your academic and skills details to enhance your experience !',
              maxLines: 5,
              textAlign: TextAlign.start,
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
            const MentorSkillsWidget(),
            SizedBox(height: screenHeight * 0.01),
            const MentorLevelSlider(),
            SizedBox(height: screenHeight * 0.2),
            Align(
              alignment: Alignment.centerRight,
              child: NextButton(
                onTap: () async {
                  await cubit.nextPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
