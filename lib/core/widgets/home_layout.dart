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
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFF036666),
                    spreadRadius: 0,
                    blurRadius: 0.1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                child: BottomNavigationBar(
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
                      icon: SvgPicture.asset(
                        'assets/svgs/progress.svg',
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8),
                          BlendMode.srcIn,
                        ),
                        height: 24.sp,
                        width: 24.sp,
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/svgs/progress.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                        height: 24.sp,
                        width: 24.sp,
                      ),
                      tooltip: 'Progress',
                      label: 'Progress',
                    ),
                    BottomNavigationBarItem(
                      label: 'Tasks',
                      icon: SvgPicture.asset(
                        'assets/svgs/Checklist.svg',
                        height: 26.h,
                        width: 26.w,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/svgs/Checklist.svg',
                        height: 26.h,
                        width: 26.w,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/svgs/notes.svg',
                        height: 26.h,
                        width: 26.w,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8),
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
                          Colors.black.withOpacity(0.5),
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
                      label: cubit.bottomNavBarIndex == 4
                          ? 'Mental\nHealth'
                          : 'Mental Health',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
