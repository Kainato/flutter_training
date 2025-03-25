import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/cache/cache_key.dart';
import '../home/home_page.dart';

class LoginGetxController extends GetxController {
  /// [TextEditingController] para o campo de e-mail
  TextEditingController emailController = TextEditingController();

  /// [FocusNode] para o campo de e-mail
  FocusNode emailFocus = FocusNode();

  /// [TextEditingController] para o campo de senha
  TextEditingController passwordController = TextEditingController();

  /// [FocusNode] para o campo de senha
  FocusNode passwordFocus = FocusNode();

  /// [RxBool] para controlar a visibilidade da senha
  RxBool obscureText = true.obs;

  /// Método para alternar a visibilidade da senha
  void toggleObscureText() => obscureText.value = !obscureText.value;

  /// [Form] para validação dos campos
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Método para realizar o login
  void login() {
    if (formKey.currentState!.validate()) {
      Get.to(() => HomePage());
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool(Cachekey.isLogged.value, true);
      });
    }
  }
}
