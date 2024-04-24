import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/validate_text.dart';
import '../../../cubits/add_task_cubit/add_task_cubit.dart';
import 'package:opi_se/core/widgets/text_fields/auth_text_field.dart';

import 'add_task_button.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final AddTaskCubit cubit = BlocProvider.of<AddTaskCubit>(context);
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          height: screenHeight * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              AuthTextField(
                controller: cubit.titleController,
                hintText: 'Task Title',
                validator: (value) {
                  return validateText('task title', value!);
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Content',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              AuthTextField(
                controller: cubit.contentController,
                hintText: 'Task Content',
                validator: (value) {
                  return validateText('task content', value!);
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: AuthTextField(
                          controller: cubit.startDateController,
                          readOnly: true,
                          onTap: () async {
                            await cubit.selectStartDate(context);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: AuthTextField(
                          controller: cubit.endDateController,
                          readOnly: true,
                          onTap: () async {
                            await cubit.selectEndDate(context);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.075),
              const AddTaskButton(),
            ],
          ),
        ),
      ),
    );
  }
}
