import 'package:flutter/material.dart';

class HomeController {
  /// Instância do `PageController` que controla a navegação entre as páginas.
  final PageController pageController = PageController();

  /// Instância do `index` que armazena o índice da página atual.
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  /// Método que altera a página atual com animação.
  void onPageChanged(int index) {
    // Atualiza o índice atual na [bottomavigationbar]
    currentIndex.value = index;
    // Atualiza o índice atual na [pageview]
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }
}
