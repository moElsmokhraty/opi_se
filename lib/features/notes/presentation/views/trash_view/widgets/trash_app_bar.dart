import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/trash_cubit/trash_cubit.dart';

class TrashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrashAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Trash',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 60.w,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 24.sp,
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      actions: [
        Container(
          height: 35.h,
          width: 35.w,
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: (2.5).w,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<TrashCubit>(context).flushTrash();
              },
              child: Icon(
                CupertinoIcons.delete,
                color: const Color(0XFF036666),
                size: 22.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
