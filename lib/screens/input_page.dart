import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/components/lower_container_buttons.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/calculation_result_screen.dart';
import 'package:bmi_calculator/widgets/input_screen_container.dart';
import 'package:bmi_calculator/widgets/lower_container_child_content.dart';
import 'package:bmi_calculator/widgets/upper_container_child.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender whatGender;
  double thisSlider = 0.0;
  int height = 180;
  int age = 20;
  int weight = 60;
  double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xFF0A0D22),
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: InputScreenContainers(
                    fxn: () {
                      setState(() {
                        whatGender = Gender.Male;
                      });
                    },
                    color:
                        // activeContainerColor,
                        //  Colors.blue,
                        whatGender == Gender.Male
                            ? kActiveContainerColor
                            : kInActiveContainerColor,
                    containerChild: UpperChildContainerContent(
                      title: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                //  SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: InputScreenContainers(
                    fxn: () {
                      setState(() {
                        whatGender = Gender.Female;
                      });
                    },
                    color: whatGender == Gender.Female
                        ? kActiveContainerColor
                        : kInActiveContainerColor,
                    containerChild: UpperChildContainerContent(
                      title: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: InputScreenContainers(
              color: kActiveContainerColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kHighlightedTextStyle,
                      ),
                      Text(
                        'cm',
                        textAlign: TextAlign.end,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ), //overalayshape---Ripple effect that we get on the slider
                      // : Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kBottomContainerColor.withAlpha(0x29),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      //     activeColor: Colors.white,
                      // inactiveColor: Color(0xFF8D8E98),
                      min: 120,
                      max: 220,

                      // divisions: 2,
                      onChanged: (sliderDouble) {
                        setState(() {
                          height = sliderDouble.toInt();
                        });
                      },
                      value: height.toDouble(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InputScreenContainers(
                    color: kActiveContainerColor,
                    containerChild: Column(
                      children: <Widget>[
                        LowerContainerChildContent(
                          title: 'WEIGHT',
                          number: weight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LowerContainerIconButtons(
                              icon: FontAwesomeIcons.plus,
                              fxn: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            LowerContainerIconButtons(
                              icon: FontAwesomeIcons.minus,
                              fxn: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //  SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: InputScreenContainers(
                    color: kActiveContainerColor,
                    containerChild: Column(
                      children: <Widget>[
                        LowerContainerChildContent(
                          title: 'AGE',
                          number: age,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LowerContainerIconButtons(
                              icon: FontAwesomeIcons.plus,
                              fxn: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            LowerContainerIconButtons(
                              icon: FontAwesomeIcons.minus,
                              fxn: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // calculateBMI();
              BMIBrain brain = BMIBrain(height: height, weight: weight);
              // print('This is the value of reults ${brain.getResult()}');
              // print('This is the value of comments ${brain.getComments()}');
              // print('This is BMIVALUE:  ${brain.calculateBMI()}');
              // print(calculateBMI());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalculationResultScreen(
                    bmiResult: brain.calculateBMI(),
                    interpretation: brain.getComments(),
                    resultText: brain.getResult(),
                  ),
                ),
              );

              // CalculationResultScreen.routeName,
              // arguments: [
              //   brain.calculateBMI(),
              //   brain.getResult(),
              //   brain.getComments()
              // ]);
              // MaterialPageRoute(
              //     builder: (context) => CalculationResultScreen(),
              //     settings: RouteSettings(
              //         arguments: [whatGender, thisSlider, weight, age])),
              //  );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              width: double.infinity,
              child: Center(
                  child: Text(
                'CALCULATE',
                style: kBottomTextStyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
