import 'package:flutter/material.dart';
import 'package:flutter_training/core/enum/app_text_theme.dart';
import 'package:flutter_training/modules/auth/login_getx_controller.dart';
import 'package:get/get.dart';

import '../../core/theme/theme_controller.dart';
import '../../widget/form/standard_text_form_field.dart';
import '../../widget/paint/wave_painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ThemeController themeController = Get.find();
  final LoginGetxController loginGetxController =
      Get.put(LoginGetxController());

  @override
  void dispose() {
    loginGetxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: Get.height * 0.5,
                    width: Get.width,
                    color: themeController.primaryColor,
                    child: CustomPaint(
                      painter: WavePainter(
                        color: themeController.surfaceColor,
                        waveCurl: 0.15,
                        waveHeight: 0.8,
                        qtdComprimentoOnda: Get.width ~/ (Get.width ~/ 2),
                      ),
                    ),
                  ),
                  Text(
                    'Flutter Training',
                    style: AppTextTheme.headlineLarge.style.copyWith(
                      color: themeController.onPrimaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                height: Get.height * 0.5,
                color: themeController.surfaceColor,
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: loginGetxController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    spacing: 16.0,
                    children: [
                      StandardTextFormField(
                          isRequired: true,
                          label: 'E-mail',
                          hint: 'Exemplo: seu_email@provedor.com',
                          keyboardType: TextInputType.emailAddress,
                          focusNode: loginGetxController.emailFocus,
                          controller: loginGetxController.emailController,
                          onFieldSubmitted: (_) {
                            loginGetxController.emailFocus.unfocus();
                            FocusScope.of(context).requestFocus(
                                loginGetxController.passwordFocus);
                          }),
                      Obx(
                        () => StandardTextFormField(
                          isRequired: true,
                          label: 'Senha',
                          hint: 'Digite sua senha',
                          focusNode: loginGetxController.passwordFocus,
                          controller: loginGetxController.passwordController,
                          obscureText: loginGetxController.obscureText.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              !loginGetxController.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () =>
                                loginGetxController.toggleObscureText(),
                          ),
                          onFieldSubmitted: (_) {
                            loginGetxController.passwordFocus.unfocus();
                            loginGetxController.login();
                          },
                        ),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () => loginGetxController.login(),
                        icon: Icon(Icons.login),
                        label: Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
