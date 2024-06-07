import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/manage_profile_app_bar.dart';
import 'widgets/mange_profile_view_body.dart';

class ManageProfileView extends StatelessWidget {
  const ManageProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        GoRouter.of(context).pop();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: ManageProfileAppBar(),
        body: SafeArea(
          child: ManageProfileViewBody(),
        ),
      ),
    );
  }
}
