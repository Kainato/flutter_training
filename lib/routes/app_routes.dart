import 'package:flutter/material.dart';

import '../app/home_page.dart';
import '../app/increment_page.dart';

enum AppRoutes { home, increment }

extension AppRoutesExtension on AppRoutes {
  bool isSelected(BuildContext context) {
    return ModalRoute.of(context)?.settings.name == path;
  }

  String get path {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.increment:
        return '/increment';
    }
  }

  String get name {
    switch (this) {
      case AppRoutes.home:
        return 'Página inicial';
      case AppRoutes.increment:
        return 'Botões';
    }
  }

  IconData get icon {
    switch (this) {
      case AppRoutes.home:
        return Icons.home;
      case AppRoutes.increment:
        return Icons.circle;
    }
  }

  Map<String, WidgetBuilder> get routes {
    switch (this) {
      case AppRoutes.home:
        return {'/': (context) => const HomePage()};
      case AppRoutes.increment:
        return {'/increment': (context) => const IncrementPage()};
    }
  }

  static Map<String, WidgetBuilder> get allRoutes {
    return {for (var route in AppRoutes.values) ...route.routes};
  }
}
