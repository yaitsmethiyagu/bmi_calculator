import 'dart:math';
import 'package:bmi_calculator/input_page.dart';

class BMIBrain {
  final double height;
  final double weight;
  final Gender sex;
  final int age;

  double _bmiresults = 0;

  BMIBrain(
      {required this.height,
      required this.weight,
      required this.sex,
      required this.age});

  String getBMIResults() {
    _bmiresults = weight / pow(height / 100, 2);
    return _bmiresults.toStringAsFixed(1);
  }

  String getBMIAnswer() {
    String bmianswer = "";

    if (_bmiresults <= 18.5) {
      bmianswer = "Underweight";
    } else if (_bmiresults > 18.5 && _bmiresults <= 25) {
      bmianswer = "Normal";
    } else if (_bmiresults > 25 && _bmiresults <= 30) {
      bmianswer = "Overweight";
    } else if (_bmiresults > 30) {
      bmianswer = "Obese";
    }
    return bmianswer;
  }

  String getBMIDescription() {
    String bmiDescription = "";

    if (_bmiresults <= 18.5) {
      bmiDescription = "oh no!! eat more";
    } else if (_bmiresults > 18.5 && _bmiresults <= 25) {
      bmiDescription = "Stay healthy as you are";
    } else if (_bmiresults > 25 && _bmiresults <= 30) {
      bmiDescription = "Never too late, Get a Gym subscription now";
    } else if (_bmiresults > 30) {
      bmiDescription = "Stop everything, take action right now";
    }
    return bmiDescription;
  }
}
