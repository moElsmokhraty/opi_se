import 'opi_se.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/constants.dart';
import 'core/utils/socket_service.dart';
import 'core/utils/service_locator.dart';
import 'core/functions/setup_hive_db.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    setupHiveDB(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
  if (userCache != null) SocketService.connect();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setupServiceLocator();
  runApp(const OpiSe());
}
