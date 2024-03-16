import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../data/models/get_all_notes_response/note.dart';
import '../../../cubits/notes_cubit/notes_cubit.dart';
import '../../../../data/models/delete_note_models/delete_note_request.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: noteColors[note?.noteColor ?? '--note1'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              BlocProvider.of<NotesCubit>(context).pinNote(
                noteId: note!.id!,
              );
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: pi / 4.0,
                child: Icon(
                  (note?.isPinned ?? false)
                      ? Icons.push_pin
                      : Icons.push_pin_outlined,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          Text(
            DateFormat('dd/MM/yyyy').format(note?.createdAt ?? DateTime.now()),
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 12.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                note!.noteTitle!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(RoutesConfig.editNote, extra: note!);
                },
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: SvgPicture.asset('assets/svgs/pen.svg'),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(height: (1.5).h, color: Colors.black.withOpacity(0.5)),
          SizedBox(height: 10.h),
          Expanded(
            child: Text(
              note?.noteContent ?? 'No content',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 12.sp,
                fontFamily: 'Inter',
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(
                Icons.alarm_outlined,
                color: Colors.black.withOpacity(0.5),
                size: 16.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                '${DateFormat('EEEE').format(note?.createdAt ?? DateTime.now())} ${DateFormat('HH:mm').format(note?.createdAt ?? DateTime.now())}',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  BlocProvider.of<NotesCubit>(context).deleteNote(
                    noteId: note!.id!,
                  );
                },
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.black.withOpacity(0.7),
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
