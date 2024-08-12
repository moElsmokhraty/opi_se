import 'package:flutter/material.dart';
import 'widgets/requests_app_bar.dart';
import 'widgets/requests_view_body.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: RequestsAppBar(),
        body: RequestsViewBody(),
      ),
    );
  }
}
