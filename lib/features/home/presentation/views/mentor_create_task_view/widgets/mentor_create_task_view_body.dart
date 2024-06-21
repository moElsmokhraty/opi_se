import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mentor_task_item.dart';
import 'add_question_button.dart';

class MentorCreateTaskViewBody extends StatelessWidget {
  const MentorCreateTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const MentorTaskItem();
            },
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: 5,
          ),
          const AddQuestionButton(),
        ],
      ),
    );
  }
}
