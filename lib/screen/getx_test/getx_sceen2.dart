import 'package:flutter/material.dart';
import 'package:flutter_palworld/screen/getx_test/personal_card_screen.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PersonalCard(),
    );
  }
}
