import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/functions/modify_user_prefers_cache.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../cubits/edit_user_prefers_cubit/edit_user_prefers_cubit.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    EditUserPrefersCubit cubit = BlocProvider.of<EditUserPrefersCubit>(context);
    return BlocConsumer<EditUserPrefersCubit, EditUserPrefersState>(
      listener: (context, state) async {
        if (state is EditUserPrefersSuccess) {
          await modifyUserPrefersCache(
            skills: cubit.skills,
            fieldOfStudy: cubit.fieldOfStudyController.text.trim(),
            specialization: cubit.specializationController.text.trim(),
          ).then((value) {
            GoRouter.of(context).pushReplacement(RoutesConfig.homeLayout);
            showCustomSnackBar(
              context,
              'User Prefers edited successfully!',
            );
          });
        } else if (state is EditUserPrefersFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is EditUserPrefersLoading) {
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
                await cubit.editUserPrefers();
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
