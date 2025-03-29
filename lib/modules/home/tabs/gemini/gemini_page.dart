import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_training/modules/home/tabs/gemini/gemini_getx_controller.dart';
import 'package:flutter_training/widget/form/standard_text_form_field.dart';
import 'package:get/get.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  @override
  Widget build(BuildContext context) {
    final GeminiGetxController controller = Get.put(GeminiGetxController());
    return Column(
      spacing: 16,
      children: [
        StandardTextFormField(
          label: 'Quero falar sobre...',
          hint: 'Insira de 3 a 5 informações...',
          controller: controller.textEditingController,
          onFieldSubmitted: (text) => controller.requestGemini(),
        ),
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.textList.length,
              itemBuilder: (context, index) {
                Candidates candidates = controller.textList[index];
                Part part = candidates.content!.parts!.first;
                return Card(
                  child: ListTile(
                    title: Text(
                      part.toString(),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.textList.removeAt(index),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
