import 'package:flutter/material.dart';
import 'widgets/library_app_bar.dart';
import 'widgets/library_view_body.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: LibraryAppBar(),
      body: SafeArea(
        child: LibraryViewBody(),
      ),
    );
  }
}
