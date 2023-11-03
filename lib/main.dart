import 'package:flutter/material.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
          routerConfig: AppRouter.router,
          title: 'OpiSe',
          theme: Theme.of(context),
        );
      },
    );
  }
}
