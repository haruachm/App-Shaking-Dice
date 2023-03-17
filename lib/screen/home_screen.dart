// ignore_for_file: prefer_const_constructors
import 'package:app_shaking_dice/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'asset/img/dice$number.png',
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          '랜덤으로 나온 주사위 숫자는? ',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 70.0,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        )
      ],
    );
  }
}
