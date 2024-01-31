import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/core/utils/service_locator.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';
import 'package:opi_se/features/auth/domain/use_cases/upload_national_id_use_case.dart';
import 'package:opi_se/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'core/utils/constants.dart';
import 'core/utils/routes_config/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
  setupServiceLocator();
  SocketService.connect();
  token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDgzMTA1MWM4YTdiM2E3ZWRlNzljZSIsInVzZXJOYW1lIjoibW9oYW1lZDEiLCJlbWFpbCI6Im1lbHNtb2tocmF0eUB5YWhvby5jb20iLCJuYXRpb25hbElkIjoiNCIsImlhdCI6MTcwNjQ1MzU4OX0.TLa4ZOlRR9E-pEd3GbA-23xR2Sm69Trmw741V5vozOY';
  userId = '6544fb51e09bf066c237cc48';
  email = 'melsmokhraty@yahoo.com';
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
