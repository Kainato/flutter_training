import 'package:flutter/material.dart';
import 'package:flutter_training/extension/build_context_extension.dart';
import 'package:flutter_training/routes/app_routes.dart';

import '../routes/app_navigator.dart';

class StandardDrawer extends StatelessWidget {
  const StandardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(
              'Drawer Header',
              style: context.headlineLarge,
              maxLines: 2,
            ),
          ),
          ListTile(
            title: Text(AppRoutes.home.name),
            leading: Icon(AppRoutes.home.icon),
            selected: AppRoutes.home.isSelected(context),
            onTap: () => AppNavigator.pushReplacement(AppRoutes.home),
          ),
          ListTile(
            title: Text(AppRoutes.increment.name),
            leading: Icon(AppRoutes.increment.icon),
            selected: AppRoutes.increment.isSelected(context),
            onTap: () => AppNavigator.push(AppRoutes.increment),
          ),
        ],
      ),
    );
  }
}
