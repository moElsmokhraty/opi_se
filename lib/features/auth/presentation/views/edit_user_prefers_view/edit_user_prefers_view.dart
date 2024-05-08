import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'widgets/edit_user_prefers_view_body.dart';

class EditUserPrefersView extends StatelessWidget {
  const EditUserPrefersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: EditUserPrefersViewBody(),
      ),
    );
  }
}
