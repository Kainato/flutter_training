import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  /// Cor que ficará na parte debaixo da onda.
  final Color color;

  /// Quantidade de comprimentos de ondas que serão desenhadas.
  final int qtdComprimentoOnda;

  /// De em que altura a ondulação será desenhada.
  /// Insira um valor entre 0 e 1.
  final double waveHeight;

  /// Curvatura da ondulação.
  /// Insira um valor entre 0 e 1.
  final double waveCurl;

  /// `WavePainter` é um `CustomPainter` que desenha uma onda na tela.
  WavePainter({
    this.waveHeight = 0.5,
    this.waveCurl = 0.25,
    required this.color,
    this.qtdComprimentoOnda = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double highPoint = waveHeight + waveCurl;
    double lowPoint = waveHeight - waveCurl;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * waveHeight);

    /// O passo é a distância entre cada onda
    final double step = 1.0 / qtdComprimentoOnda;

    // StartX, EndX e ControlX são os pontos de controle da curva de Bezier
    for (int i = 0; i < qtdComprimentoOnda; i++) {
      /// - StartX é o ponto inicial da curva
      final double startX = i * step; // i = 0, 1, 2, 3, 4 | step = 0.2

      /// - EndX é o ponto final da curva
      final double endX = (i + 1) * step;

      /// - ControlX é o ponto de controle da curva
      final double controlX = startX + step / 2;

      path.quadraticBezierTo(
        size.width * controlX,
        size.height * (i % 2 == 0 ? lowPoint : highPoint),
        size.width * endX,
        size.height * waveHeight,
      );
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
