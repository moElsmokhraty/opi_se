import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/level_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'next_button.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/skills_widget.dart';

class UserPrefersPage extends StatelessWidget {
  const UserPrefersPage({super.key, required this.cubit});

  final UserPrefersCubit cubit;

  @override
  Widget build(BuildContext context) {
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
              'Complete your academic and skills details to enhance your Study Partner experience !',
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
            SkillsWidget(cubit: cubit),
            SizedBox(height: screenHeight * 0.01),
            LevelSlider(cubit: cubit),
            SizedBox(height: screenHeight * 0.025),
            Align(
              alignment: Alignment.centerRight,
              child: NextButton(
                onTap: () {
                  if (cubit.skills.isEmpty) {
                    showCustomSnackBar(
                        context, 'Please add at least one skill');
                  }
                  if (cubit.formKey.currentState!.validate() &&
                      cubit.skills.isNotEmpty) {
                    cubit.nextPage();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
