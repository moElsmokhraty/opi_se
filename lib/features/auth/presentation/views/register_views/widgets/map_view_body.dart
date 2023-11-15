import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../../../core/functions/show_snack_bar.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../../../../core/utils/routes_config/routes_config.dart';
import '../../../cubits/register_cubit/register_cubit.dart';

/// A Flutter widget for displaying a map with various controls and functionalities.
class MapViewBody extends StatefulWidget {
  final String baseUri = 'https://nominatim.openstreetmap.org';

  const MapViewBody({Key? key}) : super(key: key);

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

/// The state of the [MapViewBody] widget.
class _MapViewBodyState extends State<MapViewBody> {
  late MapController _mapController;
  late http.Client client;
  late Future<Position?> latlongFuture;

  /// Gets the current position's latitude and longitude.
  Future<Position?> getCurrentPosLatLong() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    // Request permission if not granted.
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      return await getPosition(locationPermission);
    }

    // Display a message and open settings if location permission is denied forever.
    if (locationPermission == LocationPermission.deniedForever) {
      showCustomSnackBar(context, 'Please enable location permission');
      Future.delayed(const Duration(seconds: 1), () async {
        if (Platform.isAndroid) {
          await Geolocator.openAppSettings();
        }
      });
      return await getPosition(locationPermission);
    }

    // Get the current position.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
    );
    setNameCurrentPosAtInit(position.latitude, position.longitude);
    return position;
  }

  /// Gets the current position based on the provided [locationPermission].
  Future<Position?> getPosition(LocationPermission locationPermission) async {
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      return null;
    }

    // Get the current position.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
    );
    setNameCurrentPosAtInit(position.latitude, position.longitude);
    return position;
  }

  /// Sets the name for the current position based on the map center.
  Future<void> setNameCurrentPos() async {
    double latitude = _mapController.center.latitude;
    double longitude = _mapController.center.longitude;

    // Print latitude and longitude in debug mode.
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }

    // Construct the URL for reverse geocoding.
    String url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    // Make a GET request to the server.
    var response = await client.get(Uri.parse(url));
    jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    setState(() {});
  }

  /// Sets the name for the current position at initialization based on the provided [latitude] and [longitude].
  Future<void> setNameCurrentPosAtInit(
      double latitude, double longitude) async {
    // Construct the URL for reverse geocoding.
    String url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    // Make a GET request to the server.
    var response = await client.get(Uri.parse(url));
    jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
  }

  @override
  void initState() {
    _mapController = MapController();
    client = http.Client();

    // Listen to map move events.
    _mapController.mapEventStream.listen(
      (event) async {
        if (event is MapEventMoveEnd) {
          var client = http.Client();
          String url =
              '${widget.baseUri}/reverse?format=json&lat=${event.center.latitude}&lon=${event.center.longitude}&zoom=18&addressdetails=1';

          var response = await client.get(Uri.parse(url));
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
          setState(() {});
        }
      },
    );

    // Get the current position at initialization.
    latlongFuture = getCurrentPosLatLong();
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position?>(
      future: latlongFuture,
      builder: (context, snapshot) {
        LatLng? mapCentre;
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the position.
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        }
        if (snapshot.hasError) {
          // Display an error message with a retry option.
          return GestureDetector(
            onTap: () async {
              if (await Geolocator.isLocationServiceEnabled()) {
                setState(() {
                  latlongFuture = getCurrentPosLatLong();
                });
              } else if (await Geolocator.checkPermission() ==
                  LocationPermission.denied) {
                showCustomSnackBar(
                    context, 'Please enable location permission');
              } else if (await Geolocator.checkPermission() ==
                  LocationPermission.deniedForever) {
                showCustomSnackBar(
                    context, 'Please enable location permission');
              } else if (!await Geolocator.isLocationServiceEnabled()) {
                showCustomSnackBar(context, 'Please enable location service');
              }
            },
            child: Center(
              child: Text(
                'Something went wrong\n tap to retry',
                style: AppStyles.textStyle24,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          mapCentre = LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
        }
        return SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterMap(
                  options: MapOptions(
                    center: mapCentre,
                    zoom: 15.0,
                    maxZoom: 18,
                    minZoom: 1,
                  ),
                  mapController: _mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                bottom: 200.h,
                right: 10.w,
                child: FloatingActionButton(
                  heroTag: 'zoomIn',
                  backgroundColor: const Color(0xff036666),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  onPressed: () {
                    _mapController.move(
                      _mapController.center,
                      _mapController.zoom + 1,
                    );
                  },
                  child: Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 140.h,
                right: 10.w,
                child: FloatingActionButton(
                  heroTag: 'zoomOut',
                  backgroundColor: const Color(0xff036666),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  onPressed: () {
                    _mapController.move(
                      _mapController.center,
                      _mapController.zoom - 1,
                    );
                  },
                  child: Icon(
                    Icons.remove_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 80.h,
                right: 10.w,
                child: FloatingActionButton(
                  heroTag: 'currentLocation',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  backgroundColor: const Color(0xff036666),
                  onPressed: () async {
                    if (mapCentre != null) {
                      _mapController.move(
                        LatLng(mapCentre.latitude, mapCentre.longitude),
                        15,
                      );
                    } else {
                      _mapController.move(
                        LatLng(50.5, 30.51),
                        15,
                      );
                    }
                    setNameCurrentPos();
                  },
                  child: Icon(
                    Icons.my_location_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AuthButton(
                    text: 'Set Location',
                    onPressed: () async {
                      await pickData().then((value) {
                        BlocProvider.of<RegisterCubit>(context)
                                .locationController
                                .text =
                            '${value.latLong.latitude}, ${value.latLong.longitude}';
                      });
                    },
                    backColor: const Color(0xff036666),
                    textColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<PickedData> pickData() async {
    LatLong center = LatLong(
      _mapController.center.latitude,
      _mapController.center.longitude,
    );
    var client = http.Client();
    String url =
        '${widget.baseUri}/reverse?format=json&lat=${_mapController.center.latitude}&lon=${_mapController.center.longitude}&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    var decodedResponse = jsonDecode(
      utf8.decode(response.bodyBytes),
    ) as Map<dynamic, dynamic>;
    String displayName = decodedResponse['display_name'];
    return PickedData(center, displayName, decodedResponse["address"]);
  }
}

class OSMData {
  final String displayName;
  final double lat;
  final double lon;

  OSMData({required this.displayName, required this.lat, required this.lon});

  @override
  String toString() {
    return '$displayName, $lat, $lon';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OSMData && other.displayName == displayName;
  }

  @override
  int get hashCode => Object.hash(displayName, lat, lon);
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
