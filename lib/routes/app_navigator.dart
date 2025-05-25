import 'package:flutter/material.dart';
import 'package:flutter_training/routes/app_routes.dart';

import '../main.dart';

class AppNavigator {
  static push(
    AppRoutes route, {
    Object? arguments,
    RouteTransitionsBuilder? transition,
  }) {
    final WidgetBuilder builder = route.routes[route.path]!;
    bool isCurrentRoute =
        ModalRoute.of(navigatorKey.currentContext!)?.settings.name ==
        route.path;
    if (isCurrentRoute) {
      return Navigator.pop(navigatorKey.currentContext!);
    } else {
      return Navigator.of(navigatorKey.currentContext!).push(
        PageRouteBuilder(
          settings: RouteSettings(arguments: arguments, name: route.path),
          pageBuilder:
              (context, animation, secondaryAnimation) => builder(context),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder:
              transition ??
              (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
        ),
      );
    }
  }

  static pop<T extends Object?>([T? result]) {
    return Navigator.of(navigatorKey.currentContext!).pop(result);
  }

  static popUntil(String path) {
    return Navigator.of(
      navigatorKey.currentContext!,
    ).popUntil((route) => route.settings.name == path);
  }

  static pushReplacement(
    AppRoutes route, {
    Object? arguments,
    RouteTransitionsBuilder? transition,
  }) {
    final WidgetBuilder builder = route.routes[route.path]!;
    return Navigator.of(navigatorKey.currentContext!).pushReplacement(
      PageRouteBuilder(
        settings: RouteSettings(arguments: arguments, name: route.path),
        pageBuilder:
            (context, animation, secondaryAnimation) => builder(context),
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder:
            transition ??
            (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
      ),
    );
  }
}
