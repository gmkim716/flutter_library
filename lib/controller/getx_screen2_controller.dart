import 'package:flutter_palworld/model/getx_screen2_model.dart';
import 'package:get/get.dart';

class Controller2 extends GetxController {
  final person = Person().obs; // obs: observable, 상태 변화를 감지하여 화면을 다시 그려준다

  void updateInfo() {
    // cf. update() 메서드와는 다름
    person.update((val) {
      val?.age++;
      val?.name = 'Jayden';
    });
  }
}
