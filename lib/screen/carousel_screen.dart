import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        // print('실행!');

        // 현재 페이지 가져오기
        int? nextPage = pageController.page?.toInt();

        // 다음 페이지 설정
        if (nextPage == null) {
          return;
        }
        if (nextPage == 3) {
          nextPage = 0;
        } else {
          nextPage++;
        }

        // 다음 페이지로 이동
        pageController.animateToPage(
          nextPage, // 다음 페이지
          duration: Duration(milliseconds: 500),
          curve: Curves.ease, // 페이지 전환 애니메이션 설정
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: pageController, // pageController 등록
        children: ['1.webp', '2.jpg', '3.webp', '4.jpg']
            .map(
              (img) => Image.asset('assets/imgs/$img', fit: BoxFit.cover),
            )
            .toList(),
      ),
    );
  }
}
