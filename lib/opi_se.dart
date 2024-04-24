import 'core/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/notifications_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpiSe extends StatefulWidget {
  const OpiSe({super.key});

  @override
  State<OpiSe> createState() => _OpiSeState();
}

class _OpiSeState extends State<OpiSe> {
  final NotificationsServices notificationsServices = NotificationsServices();

  @override
  void initState() {
    super.initState();
    notificationsServices.requestPermission();
    notificationsServices.initFirebaseListeners();
    notificationsServices.initLocalNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AppCubit(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              title: 'OpiSe',
            ),
          );
        },
      ),
    );
  }
}
