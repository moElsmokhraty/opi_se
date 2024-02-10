import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../cubits/profile_cubit/profile_cubit.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key, required this.state});

  final ProfileState state;

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xff366666).withOpacity(0.4),
                        const Color(0xff366666).withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 12.w,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.black.withOpacity(0.7),
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 75.h),
          ],
        ),
        Positioned(
          bottom: 11.h,
          left: 11.w,
          child: Stack(
            children: [
              StatefulBuilder(
                builder: (
                  BuildContext context,
                  void Function(void Function()) setState,
                ) {
                  if (state is GetProfileSuccess){
                    setState(() {});
                  }
                  return Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 8.w,
                      ),
                      color: const Color(0XFF9AC2C2),
                    ),
                    child: CircleAvatar(
                      radius: 65.r,
                      backgroundColor: const Color(0XFF9AC2C2),
                      child: userCache!.profileImage! == 'default.png'
                          ? Text(
                              userCache!.userName![0].toUpperCase() +
                                  userCache!.userName![1].toUpperCase(),
                              style: AppStyles.textStyle16.copyWith(
                                fontSize: 30.sp,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(150.r),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: CachedNetworkImage(
                                imageUrl: userCache!.profileImage!,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0XFF036666),
                                  ),
                                ),
                                height: 150.h,
                                width: 150.w,
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10.h,
                right: 15.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFF036666),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 4.w,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: PopupMenuButton(
                    position: PopupMenuPosition.under,
                    tooltip: 'Options',
                    surfaceTintColor: Colors.white,
                    onSelected: (value) {},
                    offset: const Offset(-150, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'upload',
                          onTap: () async {
                            await cubit.pickImage();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.upload_outlined,
                                color: Colors.black,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Upload Photo',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'take',
                          onTap: () async {
                            await cubit.takeImage();
                          },
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.camera,
                                color: Colors.black,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Take Photo',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'remove',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.black,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Remove Photo',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            await cubit.deleteProfileImage();
                          },
                        ),
                      ];
                    },
                    child: Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
