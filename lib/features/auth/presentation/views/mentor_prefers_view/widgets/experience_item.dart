import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_experience_button.dart';
import 'edit_experience_dialog.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';
import '../../../../data/models/mentor_login_models/mentor_login_response/experience.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    required this.index,
  });

  final Experience experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final MentorPrefersCubit cubit = BlocProvider.of(context);
    return SizedBox(
      width: 290.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 290.w,
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1.5.w,
              ),
            ),
            child: SizedBox(
              width: 290.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          experience.title ?? '',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 20.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return new BlocProvider(
                                create: (context) {
                                  return cubit
                                    ..setEditExperienceInitialValues(
                                      experience,
                                    );
                                },
                                child: EditExperienceDialog(index: index),
                              );
                            },
                          ).then((value) {
                            cubit.clearEditExperienceFields();
                          });
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0XFF036666),
                              width: 1.5.w,
                            ),
                          ),
                          child: Icon(
                            size: 17.sp,
                            Icons.edit_outlined,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      '${experience.companyName} - ${experience.employmentType}',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      '${formatDate(experience.startDate)} - ${formatDate(experience.endDate)}',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (index == cubit.experiences.length - 1)
            const AddExperienceButton(),
        ],
      ),
    );
  }

  String formatDate(DateTime? date) {
    if (date == null || DateTime.now().difference(date).inDays == 0) {
      return 'Present';
    }
    String formattedDate = DateFormat('MMMM yyyy').format(date);
    return formattedDate;
  }
}
