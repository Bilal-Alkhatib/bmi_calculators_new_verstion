import 'package:bmi_calculators_new_verstion/calculatorbrain.dart';
import 'package:bmi_calculators_new_verstion/conistants.dart';
import 'package:bmi_calculators_new_verstion/reusable-card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: Text(
            'YOUR RESULT !',
            style: kNumberTextStyle ))),

          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Text(
                    resultText,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.green),
                  )),
                  Container(
                      child: Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Container(
                    padding: EdgeInsets.all(10.0),
                      child: Text(
                    interpretation,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {

              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              height: kButtomHight,
              width: double.infinity,
              color: kBottomContainerColor,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeBottomTextStyle,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
