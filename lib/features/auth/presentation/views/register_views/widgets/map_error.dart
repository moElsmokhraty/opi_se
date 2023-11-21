import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:opi_se/core/utils/styling/styles.dart';
import 'package:opi_se/core/widgets/buttons/auth_button.dart';

class MapError extends StatelessWidget {
  const MapError({
    super.key,
    required this.isLocationServiceEnabled,
    required this.locationPermission,
    required this.onPressed,
  });

  final bool isLocationServiceEnabled;
  final LocationPermission locationPermission;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    String errorMessage = error();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/map_error.png',
            height: 200.h,
            width: double.infinity,
          ),
          Text(
            'Allow Location $errorMessage',
            overflow: TextOverflow.visible,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle24.copyWith(fontSize: 30.sp),
          ),
          SizedBox(height: screenHeight * 0.035),
          Text(
            'We will need your location to give you better experience',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle12.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          AuthButton(
            text: 'Access Location',
            onPressed: onPressed,
            backColor: const Color(0xFF036666),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  String error() {
    if (!isLocationServiceEnabled) {
      return 'Service';
    } else if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever ||
        locationPermission == LocationPermission.unableToDetermine) {
      return 'Permission';
    }
    return '';
  }
}
