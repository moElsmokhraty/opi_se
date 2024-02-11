import 'package:flutter/material.dart';
import 'widgets/manage_profile_app_bar.dart';
import 'widgets/mange_profile_view_body.dart';

class ManageProfileView extends StatelessWidget {
  const ManageProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: ManageProfileAppBar(),
        body: ManageProfileViewBody(),
      ),
    );
  }
}
