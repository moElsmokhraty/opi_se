import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/auth/presentation/views/user_prefers_view/widgets/user_prefers_view_body.dart';

class UserPrefersView extends StatelessWidget {
  const UserPrefersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: UserPrefersViewBody(),
      ),
    );
  }
}
