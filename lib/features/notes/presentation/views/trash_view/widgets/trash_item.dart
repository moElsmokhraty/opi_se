import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/trash_cubit/trash_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/get_all_notes_response/note.dart';
import '../../../../data/models/delete_note_from_trash_models/delete_note_from_trash_request.dart';

class TrashItem extends StatelessWidget {
  const TrashItem({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context) {
    TrashCubit cubit = BlocProvider.of<TrashCubit>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: const Color(0XFFDFDFDF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
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
              Container(
                width: 22.w,
                height: 22.h,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                child: PopupMenuButton(
                  position: PopupMenuPosition.under,
                  tooltip: 'Options',
                  color: Colors.white,
                  onSelected: (value) async {
                    if (value == 'restore') {
                      cubit.restoreNote(note!);
                    } else if (value == 'delete') {
                      await cubit.deleteNoteFromTrash(
                        DeleteNoteFromTrashRequest(
                          noteId: note!.id!,
                          matchId: note!.matchId!,
                        ),
                      );
                    }
                  },
                  offset: Offset(0, 20.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                      const PopupMenuItem(
                        value: 'restore',
                        child: Text('Restore'),
                      ),
                    ];
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 16.sp,
                  ),
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
            ],
          ),
        ],
      ),
    );
  }
}
