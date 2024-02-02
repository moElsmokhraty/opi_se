import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit = BlocProvider.of<NotesCubit>(context);
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is GetNotesFailure) {
          return Center(
            child: Text(state.failure.errMessage),
          );
        } else if (state is GetNotesSuccess) {
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
