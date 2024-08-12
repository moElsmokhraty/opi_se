import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/user_cache.dart';

class ManageProfileViewBody extends StatelessWidget {
  const ManageProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RoutesConfig.profile);
            },
            child: Container(
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
                radius: 75.r,
                backgroundColor: const Color(0XFF9AC2C2),
                child: userCache?.profileImage == 'default.png'
                    ? Text(
                        (userCache?.userName?[0].toUpperCase() ?? '') +
                            (userCache?.userName?[1].toUpperCase() ?? ''),
                        style: AppStyles.textStyle16.copyWith(
                          fontSize: 30.sp,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(150.r),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                          imageUrl: userCache?.profileImage ?? '',
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
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            userCache?.userName ?? 'User Name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            userCache?.specialization ?? 'Specialization',
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RoutesConfig.editProfile);
            },
            child: Row(
              children: [
                Icon(
                  Icons.person_outline_outlined,
                  color: Colors.black.withOpacity(0.6),
                  size: 24.sp,
                ),
                SizedBox(width: 16.w),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RoutesConfig.changePassword);
            },
            child: Row(
              children: [
                Icon(
                  Icons.security_outlined,
                  color: Colors.black.withOpacity(0.6),
                  size: 24.sp,
                ),
                SizedBox(width: 16.w),
                Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/about.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/contact_us.svg',
                  height: 24.h,
                  width: 24.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Icon(
                Icons.visibility_outlined,
                color: Colors.black.withOpacity(0.6),
                size: 24.sp,
              ),
              SizedBox(width: 16.w),
              Text(
                'Dark Mode',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Switch.adaptive(
                value: true,
                onChanged: (value) {},
                inactiveThumbColor: Colors.white,
                activeTrackColor: const Color(0XFF036666),
                inactiveTrackColor: const Color(0XFFC4C4C4),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                thumbIcon: WidgetStateProperty.all(
                  Icon(
                    Icons.nightlight_round_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          GestureDetector(
            onTap: () {
              Hive.box<UserCache>(boxName).clear();
              GoRouter.of(context).pushReplacement(RoutesConfig.getStarted);
              showCustomSnackBar(context, 'Logged out successfully');
            },
            child: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: const Color(0XFF036666),
                  size: 24.sp,
                ),
                SizedBox(width: 16.w),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: const Color(0XFF036666),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
