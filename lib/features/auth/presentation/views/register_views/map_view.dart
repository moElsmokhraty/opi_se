import 'package:flutter/material.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'OpiSe Map',
            style: AppStyles.textStyle16.copyWith(
              color: const Color(0xff036666),
            ),
          ),
        ),
        body: const MapViewBody(),
      ),
    );
  }
}
