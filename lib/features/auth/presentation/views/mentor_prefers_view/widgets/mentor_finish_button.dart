import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class MentorFinishButton extends StatelessWidget {
  const MentorFinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    MentorPrefersCubit cubit = BlocProvider.of<MentorPrefersCubit>(context);
    return BlocConsumer<MentorPrefersCubit, MentorPrefersState>(
      listener: (context, state) async {},
      builder: (context, state) {
        if (state is SubmitMentorPrefersLoading) {
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
                //await cubit.submitUserPrefers();
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
