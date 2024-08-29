import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotesAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(75.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Notes',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      toolbarHeight: 75.h,
      scrolledUnderElevation: 0,
      leadingWidth: 12.w,
      actions: (userCache?.partner?.id == null)
          ? null
          : [
              GestureDetector(
                child: IconButton(
                  onPressed: () {
                    if (userCache!.matchId != null) {
                      GoRouter.of(context).push(RoutesConfig.addNote);
                    }
                  },
                  tooltip: 'Add Note',
                  icon: Container(
                    width: 28.w,
                    height: 28.h,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: const Color(0x26036666),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                    ),
                    child: Icon(
                      Icons.add_outlined,
                      color: Colors.black,
                      size: 26.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: () {
                  if (userCache!.matchId != null) {
                    GoRouter.of(context).push(RoutesConfig.trash);
                  }
                },
                tooltip: 'Trash',
                icon: Icon(
                  Icons.delete_rounded,
                  color: const Color(0XFF036666),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 8.w),
            ],
      leading: const SizedBox.shrink(),
    );
  }
}
