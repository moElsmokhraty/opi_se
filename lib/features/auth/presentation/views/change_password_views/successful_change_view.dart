import 'package:flutter/material.dart';
import 'package:opi_se/features/auth/presentation/views/change_password_views/widgets/successful_change_view_body.dart';

class SuccessfulChangeView extends StatelessWidget {
  const SuccessfulChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SuccessfulChangeViewBody(),
      ),
    );
  }
}
