import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/consts.dart';

class ResuletButton extends StatelessWidget {

  ResuletButton({@required this.title, @required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(title,style: kResultbutton,)
        ),
        margin: EdgeInsets.only(top: 10),
        color: kBottomcontainercolor,
        width: double.infinity,
        height: 70,
      ),
    );
  }
}