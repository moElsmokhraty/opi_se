import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../../cubits/register_cubit/register_cubit.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/custom_map.dart';
import 'package:opi_se/features/auth/presentation/views/register_views/widgets/map_error.dart';

class MapViewBody extends StatefulWidget {
  final String baseUri = 'https://tile.openstreetmap.org';

  const MapViewBody({super.key});

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

  Future<void> reCheck() async {
    await setup();
    if ((locationPermission == LocationPermission.always ||
            locationPermission == LocationPermission.whileInUse) &&
        isLocationServiceEnabled) {
      setState(() {
        latlongFuture = getCurrentPosition();
      });
    }
  }

  @override
  void initState() {
    setup();

    _mapController.mapEventStream.listen(
      (event) async {
        if (event is MapEventMoveEnd) {
          var client = http.Client();
          String url =
              '${widget.baseUri}/reverse?format=json&lat=${event.camera.center.latitude}&lon=${event.camera.center.longitude}&zoom=18&addressdetails=1';

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
          return MapError(
            isLocationServiceEnabled: isLocationServiceEnabled,
            locationPermission: locationPermission,
            onPressed: () async {
              await reCheck();
            },
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          mapCentre = LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
        }
        return CustomMap(
          mapCentre: mapCentre,
          mapController: _mapController,
          cubit: cubit,
        );
      },
    );
  }
}
