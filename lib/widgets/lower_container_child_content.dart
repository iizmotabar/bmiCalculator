import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class LowerContainerChildContent extends StatelessWidget {
  final String title;
  final int number;
  final Function fxn;

  const LowerContainerChildContent({
    this.title,
    this.number,
    this.fxn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: kLabelTextStyle,
          ),
        ),
        //      SizedBox(height: 10),
        Text('$number', style: kHighlightedTextStyle),
      ],
    );
  }
}
