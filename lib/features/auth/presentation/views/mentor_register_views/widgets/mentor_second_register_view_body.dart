import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mentor_gender_widget.dart';
import 'mentor_register_label.dart';
import 'mentor_register_button.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../register_views/widgets/language_widget.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../cubits/mentor_register/mentor_register_cubit.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class MentorSecondRegisterViewBody extends StatelessWidget {
  const MentorSecondRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final MentorRegisterCubit cubit =
        BlocProvider.of<MentorRegisterCubit>(context);
    return Form(
      key: cubit.secondFormKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
          bottom: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MentorRegisterLabel(),
            SizedBox(height: screenHeight * 0.05),
            Text(
              'Age',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            AuthTextField(
              controller: cubit.ageController,
              hintText: 'Enter Your Age',
              keyboardType: TextInputType.number,
              prefixIcon: Icon(
                Icons.numbers_outlined,
                size: 21.sp,
                color: const Color(0xff036666),
              ),
              validator: (value) {
                return validateText('Age', value!);
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Gender',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            const MentorGenderWidget(),
            LanguageWidget(
              languageType: 'First',
              languageController: cubit.nativeLanguageController,
              levelController: cubit.nativeLevelController,
            ),
            LanguageWidget(
              languageType: 'Second',
              languageController: cubit.secondLanguageController,
              levelController: cubit.secondLevelController,
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              'National ID',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            AuthTextField(
              //readOnly: true,
              controller: cubit.nationalIdController,
              hintText: 'Enter Your National ID',
              // is UploadNationalIdImageLoading
              //     ? 'Uploading...'
              //     : 'Upload Your National ID',
              // onTap: () {
              //   cubit.showBottomSheet(context);
              // },
              prefixIcon: Icon(
                CupertinoIcons.doc_person,
                size: 21.sp,
                color: const Color(0xff036666),
              ),
              validator: (value) {
                return validateText('NationalId', value!);
              },
            ),
            SizedBox(height: screenHeight * 0.035),
            const MentorRegisterButton(),
          ],
        ),
      ),
    );
  }
}
