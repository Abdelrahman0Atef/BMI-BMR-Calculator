import 'package:bmi_calculator/Components/ResuletButton.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.Calculatebmi, @required this.Result, @required this.Advice});

  final String Calculatebmi;
  final String Result;
  final String Advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCLUTER"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 15,top: 10),
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
                    Result.toUpperCase(),
                    style: kResulttype,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Calculatebmi,
                    style: kResultnumber,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Advice,
                    style: kResulttext,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          ResuletButton(title: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
