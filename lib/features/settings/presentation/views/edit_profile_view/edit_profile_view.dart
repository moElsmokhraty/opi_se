import 'package:flutter/material.dart';
import 'package:opi_se/core/widgets/app_bars/auth_app_bar.dart';
import 'package:opi_se/features/settings/presentation/views/edit_profile_view/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AuthAppBar(),
        body: EditProfileViewBody(),
      ),
    );
  }
}
