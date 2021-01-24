import 'package:bmi_calculator/Components/ReresuletButton.dart';
import 'package:bmi_calculator/Components/ResuletButton.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';

class ResultPageBMR extends StatelessWidget {
  ResultPageBMR(
      {@required this.bmr, @required this.Result, @required this.AdviceBMR});

  final String bmr;
  final String Result;
  final String AdviceBMR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMR CALCLUTER"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Result',
                    style: kResulttitle,
                  ))),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colr: kInactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Result,
                    style: kResulttextbmr,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmr,
                    style: kResultnumber,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    AdviceBMR,
                    style: kResulttext,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          ReresuletButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
