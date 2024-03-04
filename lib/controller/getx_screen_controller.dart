import 'package:get/get.dart';

class Controller extends GetxController {
  int _x = 0; // _를 붙이면 private 변수로 선언
  int get x => _x; // getter

  void increment() {
    _x++;
    update(); // update 함수를 호출하여 상태 변화를 감지
  }
}
