import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../../../../core/utils/styling/styles.dart';
import '../../../../../../core/widgets/buttons/auth_button.dart';
import '../../../cubits/register_cubit/register_cubit.dart';

class MapViewBody extends StatefulWidget {
  final String baseUri = 'https://nominatim.openstreetmap.org';

  const MapViewBody({Key? key}) : super(key: key);

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  late MapController _mapController;
  late http.Client client;
  late Future<Position?> latlongFuture;
  late bool isLocationServiceEnabled;
  late LocationPermission locationPermission;

  Future<Position?> getCurrentPosition() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission != LocationPermission.always &&
        locationPermission != LocationPermission.whileInUse) {
      locationPermission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
    );
    return position;
  }

  Future<void> setup() async {
    _mapController = MapController();
    client = http.Client();
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    locationPermission = await Geolocator.checkPermission();
  }

  @override
  void initState() {
    setup();

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

    latlongFuture = getCurrentPosition();
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
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return FutureBuilder<Position?>(
      future: latlongFuture,
      builder: (context, snapshot) {
        LatLng? mapCentre;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff036666)),
          );
        }
        if (snapshot.hasError) {
          return GestureDetector(
            onTap: () {
              setState(() {
                latlongFuture = getCurrentPosition();
              });
            },
            child: buildErrorText(),
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
                    maxZoom: 18.0,
                    minZoom: 1.0,
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
                    backColor: const Color(0xff036666),
                    textColor: Colors.white,
                    onPressed: () async {
                      await pickData().then((value) {
                        cubit.locationController.text =
                            '${value.latLong.latitude},${value.latLong.longitude}';
                        GoRouter.of(context).pop();
                      });
                    },
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

  Widget buildErrorText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Text(
          !isLocationServiceEnabled
              ? 'Please enable location service, then tap to reload'
              : locationPermission == LocationPermission.denied ||
                      locationPermission == LocationPermission.deniedForever ||
                      locationPermission == LocationPermission.unableToDetermine
                  ? 'Please enable location permission, then tap to reload'
                  : 'Something went wrong, tap to reload',
          maxLines: 4,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24.copyWith(color: const Color(0xff036666)),
        ),
      ),
    );
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
