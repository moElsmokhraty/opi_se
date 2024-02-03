import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/functions/validate_text.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../cubits/edit_note_cubit/edit_note_cubit.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccess) {
          showCustomSnackBar(context, 'Note Edited Successfully');
          GoRouter.of(context).pushReplacement(RoutesConfig.notes);
        } else if (state is EditNoteFailure) {
          showCustomSnackBar(context, state.failure.errMessage);
        } else if (state is EditNoteLoading) {
          showCustomSnackBar(context, 'Loading...');
        }
      },
      builder: (context, state) {
        EditNoteCubit cubit = BlocProvider.of<EditNoteCubit>(context);
        return Form(
          key: cubit.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            physics: const BouncingScrollPhysics(),
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: double.maxFinite,
                constraints: BoxConstraints(minHeight: 400.h),
                padding: EdgeInsets.only(
                  top: 50.h,
                  left: 24.w,
                  right: 24.w,
                  bottom: 24.h,
                ),
                decoration: BoxDecoration(
                  color: cubit.backgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: cubit.titleController,
                      decoration: InputDecoration(
                        hintText: 'Note Title',
                        hintStyle: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                      ),
                      minLines: 1,
                      maxLines: 2,
                      maxLength: 45,
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) => validateText('Note Title', value!),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 2.h,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    TextFormField(
                      controller: cubit.contentController,
                      decoration: InputDecoration(
                        hintText: 'Note Content',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      validator: (value) =>
                          validateText('Note Content', value!),
                      maxLines: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(RoutesConfig.notes);
                          },
                          tooltip: 'Discard Note',
                          icon: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close_outlined,
                              color: cubit.backgroundColor,
                              size: 24.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        IconButton(
                          onPressed: () async {
                            await cubit.editNote();
                          },
                          tooltip: 'Save Note',
                          icon: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: const BoxDecoration(
                              color: Color(0XFF036666),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_outlined,
                              color: cubit.backgroundColor,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
