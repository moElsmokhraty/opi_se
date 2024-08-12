import 'package:flutter/material.dart';

import 'widgets/progress_app_bar.dart';
import 'widgets/progress_view_body.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ProgressAppBar(),
        body: SafeArea(child: ProgressViewBody()),
      ),
    );
  }
}
