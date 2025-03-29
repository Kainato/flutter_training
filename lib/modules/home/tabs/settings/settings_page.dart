import 'package:flutter/material.dart';
import 'package:flutter_training/modules/home/tabs/settings/settings_getx_controller.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsGetxController controller = Get.put(SettingsGetxController());
    return const Placeholder();
  }
}
