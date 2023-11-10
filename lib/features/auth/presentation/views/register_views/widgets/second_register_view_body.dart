import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/register_label.dart';

import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/widgets/text_fields/auth_text_field.dart';

class SecondRegisterViewBody extends StatelessWidget {
  const SecondRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
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
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                SizedBox(height: screenHeight * 0.025),
                Text(
                  'Gender',
                  style: AppStyles.textStyle16.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                AuthTextField(
                  controller: cubit.genderController,
                  hintText: 'Enter Your Gender',
                  prefixIcon: Icon(
                    Icons.transgender_outlined,
                    size: 21.sp,
                    color: const Color(0xff036666),
                  ),
                  validator: (value) {},
                ),
                SizedBox(height: screenHeight * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 190.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Language',
                            style: AppStyles.textStyle16.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          AuthTextField(
                            controller: TextEditingController(),
                            hintText: 'Your Language',
                            obscureText: false,
                            prefixIcon: Icon(
                              Icons.language_outlined,
                              size: 21.sp,
                              color: const Color(0xff036666),
                            ),
                            validator: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level',
                          style: AppStyles.textStyle16.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        DropdownMenu(
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                          hintText: 'Select',
                          width: 120.w,
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(4.sp),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                            ),
                          ),
                          menuHeight: 200.h,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: '1', label: '1'),
                            DropdownMenuEntry(value: '2', label: '2'),
                            DropdownMenuEntry(value: '3', label: '3'),
                          ],
                        ),
                        // AuthTextField(
                        //   controller: TextEditingController(),
                        //   hintText: '',
                        //   readOnly: true,
                        //   obscureText: false,
                        //   suffixIcon: IconButton(
                        //     padding: EdgeInsets.only(right: 8.w),
                        //     onPressed: () {},
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down_outlined,
                        //       size: 21,
                        //       color: Color(0xff036666),
                        //     ),
                        //   ),
                        //   validator: (value) {},
                        // ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.025),
                SizedBox(
                  width: 160.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        obscureText: false,
                        readOnly: true,
                        onTap: () {
                          ///TODO: Add File
                          // cubit.uploadFile();
                        },
                        prefixIcon: Icon(
                          CupertinoIcons.doc_person,
                          size: 21.sp,
                          color: const Color(0xff036666),
                        ),
                        validator: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
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
                SizedBox(height: screenHeight * 0.3),
              ],
            ),
          ),
        );
      },
    );
  }
}
