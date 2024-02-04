import 'package:flutter/material.dart';
import 'package:opi_se/features/notes/presentation/views/trash_view/widgets/trash_view_body.dart';

import 'widgets/trash_app_bar.dart';

class TrashView extends StatelessWidget {
  const TrashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: TrashAppBar(),
        body: TrashViewBody(),
      ),
    );
  }
}
