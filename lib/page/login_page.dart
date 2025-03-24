import 'package:flutter/material.dart';
import 'package:flutter_training/core/extensions/build_context_extension.dart';

import '../widget/paint/wave_painter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: context.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: context.height * 0.5,
                width: context.width,
                color: context.primaryContainerColor,
                child: CustomPaint(
                  painter: WavePainter(
                    color: context.surfaceColor,
                    waveCurl: 0.15,
                    waveHeight: 0.8,
                    qtdComprimentoOnda: context.width ~/ 200,
                  ),
                ),
              ),
              Container(
                width: context.width,
                height: context.height * 0.5,
                color: context.surfaceColor,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
