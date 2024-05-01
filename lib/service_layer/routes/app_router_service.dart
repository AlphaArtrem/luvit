import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luvit/presentation_layer/home/home_screen.dart';
import 'package:luvit/presentation_layer/splash_screen.dart';
import 'package:luvit/service_layer/routes/app_router_service_interface.dart';

///[AppRouterServiceInterface] implementation to manage app routes
class AppRoutersService implements AppRouterServiceInterface {
  @override
  BuildContext get context =>
      router.routeInformationParser.configuration.navigatorKey.currentContext!;

  @override
  final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: SplashScreen.route.path,
    routes: [
      GoRoute(
        path: SplashScreen.route.path,
        name: SplashScreen.route.name,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: HomeScreen.route.path,
        name: HomeScreen.route.name,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomeScreen(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Center(
          child: Text(
            'Page not found',
          ),
        ),
      );
    },
  );
}
