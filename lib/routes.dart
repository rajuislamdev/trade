import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trade/views/authentication/login_view.dart';
import 'package:trade/views/dashboard/dashboard_view.dart';
import 'package:trade/views/splash/splash_view.dart';

class Routes {
  Routes._();
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
}

Route generatedRoutes(RouteSettings settings) {
  Widget child;

  switch (settings.name) {
    //core
    case Routes.splash:
      child = const SplashView();
      break;
    case Routes.login:
      child = const LoginView();
      break;
    case Routes.dashboard:
      child = const DashboardView();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  debugPrint('Route: ${settings.name}');

  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    settings: settings,
    duration: const Duration(milliseconds: 300),
    reverseDuration: const Duration(milliseconds: 300),
  );
}
