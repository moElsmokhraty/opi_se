import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/add_note_app_bar.dart';
import 'widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const SafeArea(
        child: Scaffold(
          appBar: AddNoteAppBar(),
          body: AddNoteViewBody(),
        ),
      ),
    );
  }
}
