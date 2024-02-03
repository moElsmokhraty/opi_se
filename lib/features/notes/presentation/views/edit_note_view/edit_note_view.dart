import 'package:flutter/material.dart';
import 'widgets/edit_note_app_bar.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: EditNoteAppBar(),
        body: EditNoteViewBody(),
      ),
    );
  }
}
