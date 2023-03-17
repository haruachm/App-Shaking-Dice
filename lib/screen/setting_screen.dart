import 'package:app_shaking_dice/const/colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final double pickerValue; //Slider 노브의 현재 값
  final ValueChanged<double> onPickerChange; //Slider 노브가 움직일 때 실행되는 함수

  const SettingScreen(
      {required this.pickerValue, required this.onPickerChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          min: 0.1, //Slider 최솟값
          max: 10.0, //Slider 최댓값
          divisions: 101, //min과 max 사이의 구간 개수
          value: pickerValue, //Slider 선택한 값
          onChanged: onPickerChange, //Slider 값 변경 시 실행되는 함수
          label: pickerValue.toStringAsFixed(1), //label 형태로 Slider 값 표시
        ),
        Text(
          '민감도 설정',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
