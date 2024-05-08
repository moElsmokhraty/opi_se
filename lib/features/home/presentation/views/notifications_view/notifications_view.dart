import 'package:flutter/material.dart';

import 'widgets/notifications_app_bar.dart';
import 'widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NotificationsAppBar(),
      body: SafeArea(
        child: NotificationsViewBody(),
      ),
    );
  }
}
