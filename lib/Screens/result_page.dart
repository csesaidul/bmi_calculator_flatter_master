import 'package:bmi_calculator_flatter_master/bmi_calculator_brain.dart';
import 'package:bmi_calculator_flatter_master/constants.dart';
import 'package:bmi_calculator_flatter_master/Components/reusable_bmi_result_card.dart';
import 'package:flutter/material.dart';

import '../Components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final BMICalculatorBrain bmiCalculatorBrain;
  const ResultPage({super.key, required this.bmiCalculatorBrain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(kAppTitle)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text("Your BMI".toUpperCase(), style: kTitleTextStyle),
            ),
          ),
          SizedBox(height: 20),
          ReusableBMIResultCard(
            resultText: bmiCalculatorBrain.getResult(),
            bmiValue: bmiCalculatorBrain.calculateBMI(),
            interpretation:
                bmiCalculatorBrain.getInterpretation(),
            resultColor: bmiCalculatorBrain.getResultColor(),
          ),
          SizedBox(height: 20),
          BottomButton(
            label: "Re-Calculate",
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
