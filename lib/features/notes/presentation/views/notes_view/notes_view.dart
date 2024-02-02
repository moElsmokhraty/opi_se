import 'package:flutter/material.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/widgets/notes_app_bar.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: NotesAppBar(),
        body: NotesViewBody(),
      ),
    );
  }
}
