import 'package:flutter/material.dart';
import 'widgets/partner_request_view_body.dart';

class PartnerRequestView extends StatelessWidget {
  const PartnerRequestView({super.key, required this.requestId});

  final String requestId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PartnerRequestViewBody(requestId: requestId),
      ),
    );
  }
}
