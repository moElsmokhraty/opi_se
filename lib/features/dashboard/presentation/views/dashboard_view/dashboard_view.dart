import 'package:flutter/material.dart';
import 'widgets/dashboard_app_bar.dart';
import 'widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBar(),
        body: DashboardViewBody(),
      ),
    );
  }
}
