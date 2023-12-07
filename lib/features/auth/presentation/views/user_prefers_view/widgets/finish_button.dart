import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/features/auth/presentation/cubits/user_prefers_cubit/user_prefers_cubit.dart';

import '../../../../../../core/utils/styling/styles.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserPrefersCubit, UserPrefersState>(
      listener: (context, state) {
        if (state is SubmitUserPrefersSuccess) {
          showCustomSnackBar(context, 'User Prefers Submitted Successfully');
        } else if (state is SubmitUserPrefersFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SubmitUserPrefersLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF036666),
            ),
          );
        } else {
          return ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF036666),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              fixedSize: Size(150.w, 50.h),
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
