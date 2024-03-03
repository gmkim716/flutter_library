import 'package:flutter/material.dart';
import 'package:flutter_palworld/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
      home: HomeScreen(),
      // home: SplashScreen(),
      // home: CarouselScreen(),
      // home: WebViewScreen(),
      // home: DDayScreen(),
    ),
  );
}
