import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculaterBrain {
  CalculaterBrain(
      {@required this.height, @required this.weight, this.age, this.gender});

  final int height;
  final int weight;
  final int age;
  final bool gender;

  double _bmr;
  double _bmi;

  String Calculatebmr() {
    if (gender == true) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5 * 1.53;
      return _bmr.toStringAsFixed(1);
    } else if (gender == false) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161 * 1.53;
      return _bmr.toStringAsFixed(1);
    }
  }

  String Calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String ResultBMR() {
    return 'You have a BMR of ' + _bmr.toStringAsFixed(1);
  }

  String Result() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String Advice() {
    if (_bmi >= 25) {
      return 'High risk of developing heart disease, high blood pressure, stroke and diabetes. Try to exercise more :)';
    } else if (_bmi >= 18.5) {
      return 'Low Risk (healthy range). Good job ;)';
    } else {
      return 'Risk of developing problems such as nutritional deficiency and osteoporosis. You can eat a bit more ;)';
    }
  }

  String AdviceBMR() {
    return "• You need " +
        (_bmr - 800).toStringAsFixed(1) +
        " calories/day to lose 1 kg per week\n\n• You need " +
        (_bmr + 800).toStringAsFixed(1) +
        " calories/day gain weight 1 kg per week";
  }
}
