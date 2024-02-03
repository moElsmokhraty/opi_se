import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';

class AddNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddNoteAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    AddNoteCubit cubit = BlocProvider.of<AddNoteCubit>(context);
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        'Add Note',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        CustomColorSelector(
          color: '--note1',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note1']!);
          },
        ),
        SizedBox(width: 8.w),
        CustomColorSelector(
          color: '--note2',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note2']!);
          },
        ),
        SizedBox(width: 8.w),
        CustomColorSelector(
          color: '--note4',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note4']!);
          },
        ),
        SizedBox(width: 8.w),
        CustomColorSelector(
          color: '--note5',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note5']!);
          },
        ),
        SizedBox(width: 8.w),
        CustomColorSelector(
          color: '--note3',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note3']!);
          },
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}

class CustomColorSelector extends StatelessWidget {
  const CustomColorSelector({
    super.key,
    required this.onTap,
    required this.color,
  });

  final void Function() onTap;

  final String color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: noteColors[color],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
