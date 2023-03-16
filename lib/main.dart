// ignore_for_file: prefer_const_constructors
import 'package:app_shaking_dice/const/colors.dart';
import 'package:app_shaking_dice/screen/dice_screen.dart';
import 'package:app_shaking_dice/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DiceScreen(),
  ));
}
