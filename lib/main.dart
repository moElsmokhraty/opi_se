import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'core/utils/constants.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  setupServiceLocator();
  token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDgzMTA1MWM4YTdiM2E3ZWRlNzljZSIsInVzZXJOYW1lIjoibW9oYW1lZDEiLCJlbWFpbCI6Im1lbHNtb2tocmF0eUB5YWhvby5jb20iLCJuYXRpb25hbElkIjoiMTI0MzQyMzQzMjQ1IiwiaWF0IjoxNjk5MzE4NzkwfQ.35Id-ezJMROWMnjyGLg1kabkHTxyggi44Sx2kkCkSno';
  runApp(const OpiSe());
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
          theme: Theme.of(context),
        );
      },
    );
  }
}
