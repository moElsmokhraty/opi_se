import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/cache/hive_helper.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import '../../../cubits/user_prefers_cubit/user_prefers_cubit.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    UserPrefersCubit cubit = BlocProvider.of<UserPrefersCubit>(context);
    return BlocConsumer<UserPrefersCubit, UserPrefersState>(
      listener: (context, state) async {
        if (state is SubmitUserPrefersSuccess) {
          await HiveHelper.modifyUserPrefersCache(
            skills: cubit.skills,
            fieldOfStudy: cubit.fieldOfStudyController.text.trim(),
            specialization: cubit.specializationController.text.trim(),
          ).then((value) {
            GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
            showCustomSnackBar(
              context,
              'User Prefers submitted successfully!',
            );
          });
        } else if (state is SubmitUserPrefersFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SubmitUserPrefersLoading) {
          return SizedBox(
            width: 1.sw,
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF036666),
              ),
            ),
          );
        } else {
          return ElevatedButton(
            onPressed: () async {
              if (cubit.skills.isEmpty) {
                showCustomSnackBar(
                  context,
                  'Please add at least one skill',
                );
                return;
              }
              if (cubit.formKey.currentState!.validate()) {
                await cubit.submitUserPrefers();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF036666),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              fixedSize: Size(360.w, 54.h),
            ),
            child: Text(
              'Finish',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
      },
    );
  }
}
