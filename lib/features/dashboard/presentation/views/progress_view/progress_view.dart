import 'package:flutter/material.dart';

import 'widgets/progress_app_bar.dart';
import 'widgets/progress_view_body.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProgressAppBar(),
      body: ProgressViewBody(),
    );
  }
}
