import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/cardContent.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/Components/ResuletButton.dart';
import 'package:bmi_calculator/Screen/ResultPage.dart';
import 'package:bmi_calculator/CalculaterBrain.dart';
import 'ResultPageBMR.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  bool activestate;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI&BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        activeGender = Gender.male;
                        activestate = true;
                      });
                    },
                    colr: activeGender == Gender.male
                        ? kActivecardcolor
                        : kInactivecardcolor,
                    cardChild: cardContent(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        activeGender = Gender.female;
                        activestate = false;
                      });
                    },
                    colr: activeGender == Gender.female
                        ? kActivecardcolor
                        : kInactivecardcolor,
                    cardChild: cardContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colr: kActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'HIGHT',
                      style: Klabelstyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                        Text(
                          height.toString(),
                          style: kTexttwo,),
                      Text(
                        'cm',
                        style: Klabelstyle,
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 230,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        activeColor: kBottomcontainercolor,
                        inactiveColor: kActivecardcolor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colr: kActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'WEIGHT',
                            style: Klabelstyle,
                          ),
                        ),
                        Expanded(
                            child: StepperSwipe(
                              initialValue:weight,
                              stepperValue: weight,
                              onChanged: (int weight1) => weight = weight1,
                              firstIncrementDuration: Duration(milliseconds: 150),
                              secondIncrementDuration: Duration(milliseconds: 90),
                              direction: Axis.horizontal,
                              dragButtonColor: kBottomcontainercolor,
                              withFastCount: true,
                              withPlusMinus: true,
                              maxValue: 350,
                              minValue: 0,
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colr: kActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            'AGE',
                            style: Klabelstyle,
                          ),
                        ),
                        Expanded(
                          child: StepperSwipe(
                            initialValue:age,
                            stepperValue: age,
                            speedTransitionLimitCount: 10,
                            onChanged: (int age1) => age = age1,
                            firstIncrementDuration: Duration(milliseconds: 150),
                            secondIncrementDuration: Duration(milliseconds: 90),
                            direction: Axis.horizontal,
                            dragButtonColor: kBottomcontainercolor,
                            withFastCount: true,
                            withPlusMinus: true,
                            maxValue: 150,
                            minValue: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: ResuletButton(
                  title: 'BMI',
                  onTap: () {
                    CalculaterBrain calc =
                        CalculaterBrain(height: height, weight: weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          Calculatebmi: calc.Calculatebmi(),
                          Result: calc.Result(),
                          Advice: calc.Advice(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: ResuletButton(
                  title: 'BMR',
                  onTap: () {
                    CalculaterBrain calc = CalculaterBrain(
                        height: height, weight: weight, age: age, gender: activestate);
                    if (activestate == true || activestate == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPageBMR(
                            bmr: calc.Calculatebmr(),
                            Result: calc.ResultBMR(),
                            AdviceBMR: calc.AdviceBMR(),
                          ),
                        ),
                      );
                    } else {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.warning,
                        text: "You must choose Your Type!",
                      );
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

