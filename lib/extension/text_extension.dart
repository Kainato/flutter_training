import 'package:flutter/material.dart';

extension TextExtension on Text {
  /// - Expande o widget `Text` para ocupar toda a largura disponível.
  ///   - O parâmetro `width` define a largura máxima do widget.
  /// - Se não for fornecido, o widget ocupará toda a largura disponível.
  ///   - O widget retornado é um `SizedBox` que envolve o widget Text original.
  SizedBox expanded({double width = double.maxFinite}) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  /// Adiciona um espaçamento entre o texto e o widget pai.
  /// O espaçamento pode ser definido para os lados superior, inferior, esquerdo e direito.
  Padding padding({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: this,
    );
  }

  /// Calcula a altura do texto com base no contexto atual.
  /// O método usa o `TextPainter` para medir o tamanho do texto e retorna a altura.
  double textHeight(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: data, // O texto do widget Text
        style: DefaultTextStyle.of(context).style, // Estilo padrão do texto
      ),
      maxLines: null, // Permite múltiplas linhas
      textDirection: TextDirection.ltr, // Direção do texto
    )..layout(
      maxWidth: MediaQuery.of(context).size.width,
    ); // Define a largura máxima

    return textPainter.size.height; // Retorna a altura calculada
  }
}
