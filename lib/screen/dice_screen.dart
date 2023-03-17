// ignore_for_file: prefer_const_constructors
import 'package:app_shaking_dice/screen/home_screen.dart';
import 'package:app_shaking_dice/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  TabController? controller;
  double pickerValue = 1.0; //민감도 초기 값 설정
  int number = 1; //주사위 숫자 변수 선언

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); //컨트롤러 초기화 length: 탭 개수
    controller!.addListener(tabListener); //컨트롤러 호출될 때 실행할 함수 선언
  }

  tabListener() {
    //리스너로 사용할 함수 선언
    setState(() {});
  }

  @override
  void dispose() {
    //dispose로 리스너 함수 없애기
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller, //컨트롤러 등록, TabBarView 조작 가능
        children: renderTabScreen(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderTabScreen() {
    //탭마다의 스크린 구현
    return [
      HomeScreen(number: number),
      SettingScreen(pickerValue: pickerValue, onPickerChange: onPickerChange)
    ];
  }

//Slider 변경 시 실행되는 함수
  void onPickerChange(double val) {
    setState(() {
      pickerValue = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    //하단 Nav바 구현
    return BottomNavigationBar(
      currentIndex: controller!.index, //현재 탭에 띄워진 화면의 인덱스
      onTap: (int index) {
        //탭 클릭할 때 실행될 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          //주사위 스크린 구현
          icon: Icon(
            Icons.sports_handball_sharp,
          ),
          label: 'Dice',
        ),
        BottomNavigationBarItem(
          //설정 스크린 구현
          icon: Icon(
            Icons.settings,
          ),
          label: 'Setting',
        ),
      ],
    );
  }
}
