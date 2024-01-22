import 'package:flutter/material.dart';
import 'widgets/call_app_bar.dart';
import 'widgets/call_view_body.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CallAppBar(),
        body: CallViewBody(),
      ),
    );
  }
}
