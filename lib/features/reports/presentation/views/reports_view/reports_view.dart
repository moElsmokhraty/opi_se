import 'package:flutter/material.dart';
import 'widgets/reports_view_app_bar.dart';
import 'widgets/reports_view_body.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: ReportsViewAppBar(),
      body: SafeArea(
        child: ReportsViewBody(),
      ),
    );
  }
}
