import 'package:go_router/go_router.dart';
import 'package:opi_se/core/utils/routes_config/routes_config.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesConfig.homeView,
    routes: [

    ],
  );
}
