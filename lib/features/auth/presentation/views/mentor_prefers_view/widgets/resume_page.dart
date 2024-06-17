import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'resume_widget.dart';
import '../../../../../../core/widgets/buttons/next_button.dart';
import '../../../../../../core/widgets/buttons/previous_button.dart';
import '../../../../../../core/widgets/buttons/upload_button.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    MentorPrefersCubit cubit = BlocProvider.of<MentorPrefersCubit>(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2/4 to create your profile',
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Text(
            'We need to get a sense of your education, experience. it’s quickest to import your information.',
            maxLines: 6,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.065),
          UploadButton(
            text: 'your Resume',
            onPressed: () async {
              await cubit.pickResume();
            },
          ),
          SizedBox(height: screenHeight * 0.06),
          const ResumeWidget(),
          SizedBox(height: screenHeight * 0.267),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousButton(
                onTap: () async {
                  await cubit.previousPage();
                },
              ),
              NextButton(
                onTap: () async {
                  await cubit.nextPage();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
