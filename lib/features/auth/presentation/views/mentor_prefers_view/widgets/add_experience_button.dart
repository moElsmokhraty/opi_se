import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';
import 'add_experience_dialog.dart';

class AddExperienceButton extends StatelessWidget {
  const AddExperienceButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MentorPrefersCubit>(context);
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: const AddExperienceDialog(),
            );
          },
        ).then((value) {
          cubit.clearAddExperienceFields();
        });
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          gradient: LinearGradient(
            colors: [
              Color(0xFF036666),
              Color(0xFF14DEDE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Icon(
          Icons.add_outlined,
          size: 20.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
