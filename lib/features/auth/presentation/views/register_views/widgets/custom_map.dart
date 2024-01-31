import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../../../core/utils/styling/styles.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({
    super.key,
    required this.mapCentre,
    required this.mapController,
    required this.cubit,
  });

  final LatLng? mapCentre;
  final MapController mapController;
  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: mapCentre ?? const LatLng(50.5, 30.51),
              initialZoom: 15.0,
              maxZoom: 18.0,
              minZoom: 1.0,
            ),
            mapController: mapController,
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location',
                    style: AppStyles.textStyle16.copyWith(
                      color: const Color(0xff036666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: Icon(
                      Icons.location_pin,
                      size: 50.sp,
                      color: const Color(0xff036666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10.w,
          left: 10.w,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'zoomIn',
                backgroundColor: const Color(0xff036666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                onPressed: () {
                  mapController.move(
                    mapController.camera.center,
                    mapController.camera.zoom + 1,
                  );
                },
                child: Icon(
                  Icons.add_outlined,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 10.h),
              FloatingActionButton(
                heroTag: 'zoomOut',
                backgroundColor: const Color(0xff036666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                onPressed: () {
                  mapController.move(
                    mapController.camera.center,
                    mapController.camera.zoom - 1,
                  );
                },
                child: Icon(
                  Icons.remove_outlined,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 10.h),
              FloatingActionButton(
                heroTag: 'currentLocation',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                backgroundColor: const Color(0xff036666),
                onPressed: () async {
                  if (mapCentre != null) {
                    mapController.move(
                      LatLng(mapCentre!.latitude, mapCentre!.longitude),
                      15,
                    );
                  } else {
                    mapController.move(
                      const LatLng(50.5, 30.51),
                      15,
                    );
                  }
                },
                child: Icon(
                  Icons.my_location_outlined,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 10.h),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff036666),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  fixedSize: Size(double.maxFinite, 52.h),
                ),
                onPressed: () async {
                  await pickData().then((value) {
                    cubit.locationController.text =
                        '${value.latLong.latitude},${value.latLong.longitude}';
                    GoRouter.of(context).pop();
                  });
                },
                child: Text(
                  'Set Location',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }

  Future<PickedData> pickData() async {
    const String baseUri = 'https://nominatim.openstreetmap.org';
    LatLong center = LatLong(
      mapController.camera.center.latitude,
      mapController.camera.center.longitude,
    );
    var client = http.Client();
    String url =
        '$baseUri/reverse?format=json&lat=${mapController.camera.center.latitude}&lon=${mapController.camera.center.longitude}&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    String displayName = decodedResponse['display_name'];
    return PickedData(center, displayName, decodedResponse["address"]);
  }
}

class LatLong {
  final double latitude;
  final double longitude;

  const LatLong(this.latitude, this.longitude);
}

class PickedData {
  final LatLong latLong;
  final String addressName;
  final Map<String, dynamic> address;

  PickedData(this.latLong, this.addressName, this.address);
}
