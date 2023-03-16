// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); //컨트롤러 초기화 length: 탭 개수
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
}

List<Widget> renderTabScreen() {
  return [
    Container(
      child: Center(
        child: Text('Tab1,'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Tab2'),
      ),
    ),
  ];
}

BottomNavigationBar renderBottomNavigation() {
  return BottomNavigationBar(items: [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_handball_sharp,
      ),
      label: 'Dice',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Setting',
    ),
  ]);
}
