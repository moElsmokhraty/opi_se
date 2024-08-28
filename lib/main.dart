import 'opi_se.dart';
import 'firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'core/cache/hive_helper.dart';
import 'core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/socket_service.dart';
import 'core/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    HiveHelper.setupHiveDB(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await SocketService.connect();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const OpiSe());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
