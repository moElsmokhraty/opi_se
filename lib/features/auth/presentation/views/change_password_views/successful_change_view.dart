import 'package:flutter/material.dart';
import 'widgets/successful_change_view_body.dart';

class SuccessfulChangeView extends StatelessWidget {
  const SuccessfulChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        Navigator.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SuccessfulChangeViewBody(),
        ),
      ),
    );
  }
}
