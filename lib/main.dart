// ignore_for_file: prefer_const_constructors
import 'package:app_shaking_dice/const/colors.dart';
import 'package:app_shaking_dice/screen/dice_screen.dart';
import 'package:app_shaking_dice/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroundColor, //전체 배경 색상
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor, //슬라이더 노브 색상
        activeTrackColor: primaryColor, //노브가 이동한 트랙 색상
        inactiveTrackColor: primaryColor.withOpacity(0.5),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, //하단 nav바 선택되었을 때 색상
        unselectedItemColor: secondaryColor, //하단 nav바 선택되지 않았을 때 색상
        backgroundColor: backgroundColor, //하단 nav바 배경 색상
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: DiceScreen(),
  ));
}
