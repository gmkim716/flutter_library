import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  // 함수 정의
  void onHeartPressed() {
    // 상태 변경 시 setState() 함수 실행
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        // 날짜 선택하는 다이얼로그
        return CupertinoDatePicker(
          // 시간 제외하고 날짜만 선택
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        top: true, // 상단 여백 적용
        bottom: false, // 하단 여백 적용 안함
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Column 위젯의 children들을 위 아래 끝에 배치
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Column 위젯의 children들을 가로로 꽉 채움
          children: [
            _DDay(
              // 하트 버튼을 눌렀을 때 실행할 함수
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _Image(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  // props 정의
  final GestureTapCallback
      onHeartPressed; // GeustureTapCallback: 터치 이벤트를 처리하는 콜백 함수
  final DateTime firstDay;

  // 생성자 정의
  _DDay({
    required this.onHeartPressed, // 상위에서 함수 입력받기
    required this.firstDay, // 상위에서 날짜 입력받기
  });

  @override
  Widget build(BuildContext context) {
    // 상수 정의
    final textTheme =
        Theme.of(context).textTheme; // .of(context): main.dart에서 정의된 테마를 가리킴
    final now = DateTime.now();

    return Column(children: [
      const SizedBox(height: 16.0),
      Text('Palworld', style: textTheme.headline1),
      const SizedBox(height: 16.0),
      Text('Open', style: textTheme.bodyText1),
      Text('${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText2),
      const SizedBox(height: 16.0),
      IconButton(
        iconSize: 60.0,
        onPressed: onHeartPressed,
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      const SizedBox(height: 16.0),
      Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headline2),
    ]);
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/imgs/Mammorest.png',
        height: MediaQuery.of(context).size.height / 2, // 화면의 높이로 이미지 출력
      ),
    );
  }
}
