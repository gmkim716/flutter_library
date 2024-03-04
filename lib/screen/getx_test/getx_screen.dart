import 'package:flutter/material.dart';
import 'package:flutter_palworld/controller/getx_screen_controller.dart';
import 'package:get/get.dart'; // get import

class GetxScreen extends StatelessWidget {
  const GetxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              init: Controller(), // init에서 인스턴스 직접 생성
              builder: (_) => Text(
                'Current value is: ${Get.find<Controller>().x}', // find: Controller 클래스의 인스턴스를 찾아준다
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ), // GetBuilder: state의 변화를 감지해서 화면에 다시 그려준다, 사용하는 데이터 타입을 알려줘야 한다
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<Controller>().increment();
              },
              child: Text('add number'),
            ),
          ],
        ),
      ),
    );
  }
}
