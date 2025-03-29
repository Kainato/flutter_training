import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme_controller.dart';

class GeminiGetxController {
  final TextEditingController textEditingController = TextEditingController();
  final ThemeController themeController = Get.find();

  final RxList _textList = [].obs;

  RxList get textList => _textList;

  // Future<void> inputGemini() async {
  //   await Gemini.instance.prompt(parts: [
  //     Part.text(textEditingController.text),
  //   ]).then((value) {
  //     log('${value.runtimeType} | $value');
  //     textList.add(value);
  //   }).catchError((e) {
  //     log('error $e');
  //   });
  // }

  Future<void> requestGemini() async {
    Gemini.instance.promptStream(
      parts: [
        Part.text(textEditingController.text),
      ],
    ).listen((value) {
      // Exibe o conteúdo gerado no console
      log(value!.output.toString());
    }).onError((e) {
      // Loga erros no console
      log('exception', error: e);
    });
  }
}
