import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      actions: [
        Container(
          height: 30.h,
          width: 30.w,
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
                Icons.more_vert,
                color: const Color(0XFF036666),
                size: 24.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
