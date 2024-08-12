import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../domain/use_cases/delete_note_use_case.dart';
import '../../../domain/use_cases/get_notes_use_case.dart';
import '../../../domain/use_cases/pin_note_use_case.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'widgets/notes_app_bar.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NotesCubit(
          getIt.get<GetNotesUseCase>(),
          getIt.get<PinNoteUseCase>(),
          getIt.get<DeleteNoteUseCase>(),
        )
          ..getNotes(userCache!.matchId, 1, 10)
          ..listenOnNewNote()
          ..listenOnNotePinned()
          ..listenOnNoteDeleted();
      },
      child: const PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: NotesAppBar(),
            body: NotesViewBody(),
          ),
        ),
      ),
    );
  }
}
