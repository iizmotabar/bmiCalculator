import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/input_screen_container.dart';
import 'package:flutter/material.dart';

class CalculationResultScreen extends StatelessWidget {
  static const routeName = 'calculation-result-screen';

  final String bmiResult;
  final String resultText;
  final String interpretation;

  CalculationResultScreen(
      {@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    final CalculationResultScreen args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
                    child: Center(
              child: Text('Result'.toUpperCase(), style: kHighlightedTextStyle),
            ))),
            Expanded(
                flex: 5,
                child: InputScreenContainers(
                  color: kActiveContainerColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: TextStyle(color: Colors.green, fontSize: 30),
                      ),
                      Text(bmiResult,
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold)),
                      Text(interpretation,
                          textAlign: TextAlign.center, style: kLabelTextStyle),
                    ],
                  ),
                )),
            Expanded(
              child: InputScreenContainers(
                fxn: () {
                  Navigator.of(context).pop();
                },
                color: kBottomContainerColor,
                containerChild: Center(
                  child: Text(
                    'RECALCULATE',
                    style: kBottomTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
