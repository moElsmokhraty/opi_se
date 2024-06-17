import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class CertificatesList extends StatelessWidget {
  const CertificatesList({super.key});

  @override
  Widget build(BuildContext context) {
    MentorPrefersCubit cubit = BlocProvider.of<MentorPrefersCubit>(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<MentorPrefersCubit, MentorPrefersState>(
      builder: (context, state) {
        if (cubit.certificates.isNotEmpty) {
          return SizedBox(
            height: screenHeight * 0.355,
            child: ListView.separated(
              itemCount: cubit.certificates.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 13.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0XFFF6F6F6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/resume.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 12.h),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Text(
                          cubit.certificates[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.delete,
                          color: Colors.black,
                          size: 24.sp,
                        ),
                        onPressed: () async {
                          await cubit.removeCertificate(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(height: screenHeight * 0.355);
        }
      },
    );
  }
}
