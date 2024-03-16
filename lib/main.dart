import 'core/cubits/app_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/core/functions/setup_hive_db.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/utils/notifications_services.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseMessaging.instance.requestPermission(
    provisional: true,
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    sound: true,
  );
  await NotificationsServices.showNotification(
    body: message.data['body'],
    title: message.data['title'],
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await setupHiveDB();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationsServices.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setupServiceLocator();
  if (userCache != null) SocketService.connect();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(getIt.get<RegisterUseCase>()),
        ),
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: const OpiSe(),
    ),
  );
}

class OpiSe extends StatelessWidget {
  const OpiSe({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          title: 'OpiSe',
          theme: ThemeData(useMaterial3: true),
        );
      },
    );
  }
}
