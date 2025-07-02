import 'package:bmi_calculator_flatter_master/Components/bottom_button.dart';
import 'package:bmi_calculator_flatter_master/Components/reusable_card.dart';
import 'package:bmi_calculator_flatter_master/Components/round_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../Components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Add input validation methods
  void _incrementWeight() {
    setState(() {
      if (weight < 300) weight++;
    });
  }

  void _decrementWeight() {
    setState(() {
      if (weight > 10) weight--;
    });
  }

  void _incrementAge() {
    setState(() {
      if (age < 120) age++;
    });
  }

  void _decrementAge() {
    setState(() {
      if (age > 1) age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kAppTitle), leading: null),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              color: kInactiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("height".toUpperCase(), style: kLevelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("cm", style: kLevelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFFCCD2DF),
                      thumbColor: Color(0xFFFF0268),
                      overlayColor: Color(0x29FF0268),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    color: kInactiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("weight".toUpperCase(), style: kLevelTextStyle),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCircleButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: _decrementWeight,
                            ),
                            kHorizontalSpace,
                            RoundCircleButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: _incrementWeight,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    color: kInactiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("age".toUpperCase(), style: kLevelTextStyle),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCircleButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: _decrementAge,
                            ),
                            kHorizontalSpace,
                            RoundCircleButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: _incrementAge,
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
          BottomButton(
            label: "calculate",
            onTap: () {
              if (selectedGender != null) {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'selectedGender': selectedGender,
                    'height': height,
                    'weight': weight,
                    'age': age,
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select a gender')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
