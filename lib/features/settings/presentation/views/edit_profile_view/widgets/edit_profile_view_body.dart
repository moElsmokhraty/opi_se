import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_profile_button.dart';
import '../../../cubits/edit_profile_cubit.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/functions/validate_email.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import '../../../../../auth/presentation/views/register_views/widgets/language_widget.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    final EditProfileCubit cubit = BlocProvider.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 22.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Username',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            AuthTextField(
              controller: cubit.userNameController,
              hintText: 'Username',
              validator: (value) {
                return validateText('Username', value!);
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Email',
              style: AppStyles.textStyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            AuthTextField(
              controller: cubit.emailController,
              hintText: 'Email',
              validator: (value) {
                return validateEmail(value!);
              },
            ),
            SizedBox(height: screenHeight * 0.02),
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
            LanguageWidget(
              languageType: 'Third',
              languageController: cubit.thirdLanguageController,
              levelController: cubit.thirdLevelController,
            ),
            SizedBox(height: screenHeight * 0.02),
            const EditProfileButton(),
          ],
        ),
      ),
    );
  }
}
