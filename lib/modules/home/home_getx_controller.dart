import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeGetxController {
  RxInt currentIndex = 0.obs; // Variável reativa

  void changeIndex(int index) {
    currentIndex.value = index; // Atualiza o valor da variável reativa
  }
}
