import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/show_snack_bar.dart';
import 'note_item.dart';
import 'no_notes_widget.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../cubits/notes_cubit/notes_cubit.dart';
import 'package:opi_se/core/widgets/custom_error_widget.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit = BlocProvider.of<NotesCubit>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getNotes(userCache!.matchId!, 1, 10);
      },
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) async {
          if (state is PinNoteFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          } else if (state is PinNoteSuccess) {
            if (state.response.note!.isPinned!) {
              showCustomSnackBar(context, 'Note pinned Successfully');
            } else {
              showCustomSnackBar(context, 'Note unpinned Successfully');
            }
          } else if (state is PinNoteLoading) {
            showCustomSnackBar(context, 'Loading...');
          } else if (state is DeleteNoteSuccess) {
            showCustomSnackBar(context, 'Note deleted Successfully');
          } else if (state is DeleteNoteFailure) {
            showCustomSnackBar(context, state.failure.errMessage);
          } else if (state is DeleteNoteLoading) {
            showCustomSnackBar(context, 'Loading...');
          }
        },
        builder: (context, state) {
          if (state is GetNotesFailure) {
            if (state.failure.errMessage ==
                'You do not have a student partner yet!') {
              return const NoNotesWidget(
                  message: 'You do not have a student partner yet!');
            }
            return CustomErrorWidget(
              errorMessage: state.failure.errMessage,
              onPressed: () {},
            );
          } else if (state is GetNotesLoading && cubit.notes.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (cubit.notes.isEmpty) {
              return const NoNotesWidget(
                message:
                    'No notes are available yet. Start creating your first note.',
              );
            } else {
              return GridView.builder(
                itemCount: cubit.notes.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 16.h,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return NoteItem(note: cubit.notes[index]);
                },
              );
            }
          }
        },
      ),
    );
  }
}
