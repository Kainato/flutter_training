import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeGetxController {
  RxInt currentIndex = 0.obs; // Variável reativa

  void changeIndex(int index) {
    currentIndex.value = index; // Atualiza o valor da variável reativa
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut, // Animação suave
    );
  }

  final PageController pageController =
      PageController(); // Controlador de páginas

  Listenable get listenable =>
      pageController; // Retorna o PageController como Listenable
}
