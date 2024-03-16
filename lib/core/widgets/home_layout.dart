import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opi_se/core/cubits/app_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return SafeArea(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: cubit.bottomNavBarIndex,
              children: cubit.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: const Color(0XFF036666),
              showUnselectedLabels: false,
              showSelectedLabels: true,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                backgroundColor: Colors.transparent,
                fontFamily: 'Inter',
                color: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              currentIndex: cubit.bottomNavBarIndex,
              onTap: (index) {
                cubit.changeBottomNavBarIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.house_fill,
                    color: Colors.black.withOpacity(0.5),
                    size: 24.sp,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.house_fill,
                    color: const Color(0XFF036666),
                    size: 24.sp,
                  ),
                  tooltip: 'Home',
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: Colors.black.withOpacity(0.5),
                    size: 24.sp,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: const Color(0XFF036666),
                    size: 24.sp,
                  ),
                  tooltip: 'Chat',
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/notes.svg',
                    height: 26.h,
                    width: 26.w,
                    colorFilter: ColorFilter.mode(
                      const Color(0XFF036666).withOpacity(0.9),
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svgs/notes.svg',
                    height: 26.h,
                    width: 26.w,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  tooltip: 'Notes',
                  label: 'Notes',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/mental_health.svg',
                    height: 26.h,
                    width: 26.w,
                    colorFilter: ColorFilter.mode(
                      const Color(0XFF036666).withOpacity(0.5),
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svgs/mental_health.svg',
                    height: 26.h,
                    width: 26.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0XFF036666),
                      BlendMode.srcIn,
                    ),
                  ),
                  tooltip: 'Mental Health',
                  label: 'Mental Health',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
