import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_palworld/controller/getx_screen2_controller.dart';
import 'package:get/get.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);
  final Controller2 controller2 =
      Get.put(Controller2()); // 컨트롤러 인스턴스를 생성해서 injection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20), // EdgeInsets.all: 모든 방향으로 동일한 값 적용
              width: double.maxFinite, // double.maxFinite: 가능한 최대 크기
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // BorderRadius.circular: 모든 모서리를 둥글게 만듦
                color: Colors.blue,
              ),
              child: Center(
                // observer 준비
                child: GetX<Controller2>(
                    builder: (_) => Text(
                          'Name: ${controller2.person().name}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20), // EdgeInsets.all: 모든 방향으로 동일한 값 적용
              width: double.maxFinite, // double.maxFinite: 가능한 최대 크기
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // BorderRadius.circular: 모든 모서리를 둥글게 만듦
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('onpressed 눌렀어요?');
          controller2.updateInfo();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
