import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/gender_widget.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/register_label.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/language_widget.dart';

class SecondRegisterViewBody extends StatelessWidget {
  const SecondRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          print(state.errMessage);
          showCustomSnackBar(context, state.errMessage);
        } else if (state is RegisterSuccess) {
          GoRouter.of(context).pushReplacement(
            RoutesConfig.verifyAccount,
            extra: cubit.emailController.text,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.secondFormKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterLabel(),
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
                const GenderWidget(),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Location',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.locationController,
                  hintText: 'Select Your Location',
                  readOnly: true,
                  onTap: () {
                    GoRouter.of(context).push(RoutesConfig.map);
                  },
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    return validateText('Age', value!);
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                LanguageWidget(
                  languageType: 'Native',
                  languageController: cubit.nativeLanguageController,
                  levelController: cubit.nativeLevelController,
                ),
                SizedBox(height: screenHeight * 0.015),
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
                  controller: TextEditingController(),
                  hintText: 'Add File',
                  onTap: () {
                    ///TODO: Add File
                    // cubit.uploadFile();
                  },
                  prefixIcon: Icon(
                    CupertinoIcons.doc_person,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      return 'Please Add File';
                    } else if (value.length < 14) {
                      return 'Please Add a Valid File';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.035),
                state is RegisterLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xff036666)))
                    : AuthButton(
                        text: 'Sign Up',
                        onPressed: () async {
                          await cubit.register();
                        },
                        backColor: const Color(0xff036666),
                        textColor: Colors.white,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
