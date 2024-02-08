import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opi_se/core/functions/setup_hive_db.dart';
import 'firebase_options.dart';
import 'core/utils/constants.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/upload_national_id_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  setupServiceLocator();
  SocketService.connect();
  await setupHiveDB();
  token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzQ5NmUzYzgyMWZhZDRjYmY4YmIyYyIsInVzZXJOYW1lIjoibW9oYW1lZDMzIiwiZW1haWwiOiJuaXhhZ2ExNzcxQGZrY29kLmNvbSIsIm5hdGlvbmFsSWQiOiIxMjM2IiwiaWF0IjoxNzA3MzgyNTQ3fQ.ulF6w4drzTM0NximLAT1ML75spvbBvsPxo9D09L111c';
  userId = '6544fb51e09bf066c237cc48';
  email = 'melsmokhraty@yahoo.com';
  matchId = '65b6f2a3d325bc15c0f44b9e';
  nationalId = '4';
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            getIt.get<RegisterUseCase>(),
            getIt.get<UploadNationalIdUseCase>(),
          ),
        ),
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
