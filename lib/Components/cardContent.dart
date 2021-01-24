import 'package:flutter/material.dart';
import 'package:bmi_calculator/consts.dart';

class cardContent extends StatelessWidget {
  cardContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: Klabelstyle,
        )
      ],
    );
  }
}