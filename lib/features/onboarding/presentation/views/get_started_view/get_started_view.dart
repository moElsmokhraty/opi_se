import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/get_started_view_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        body: SafeArea(
          child: GetStartedViewBody(),
        ),
      ),
    );
  }
}
