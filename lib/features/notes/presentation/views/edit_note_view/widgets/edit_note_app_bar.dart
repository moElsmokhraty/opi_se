import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../cubits/edit_note_cubit/edit_note_cubit.dart';
import '../../../../../../core/widgets/custom_color_selector.dart';

class EditNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditNoteAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    EditNoteCubit cubit = BlocProvider.of<EditNoteCubit>(context);
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        'Edit Note',
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
        SizedBox(width: 10.w),
        CustomColorSelector(
          color: '--note2',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note2']!);
          },
        ),
        SizedBox(width: 10.w),
        CustomColorSelector(
          color: '--note4',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note4']!);
          },
        ),
        SizedBox(width: 10.w),
        CustomColorSelector(
          color: '--note5',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note5']!);
          },
        ),
        SizedBox(width: 10.w),
        CustomColorSelector(
          color: '--note3',
          onTap: () {
            cubit.changeBackgroundColor(noteColors['--note3']!);
          },
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
