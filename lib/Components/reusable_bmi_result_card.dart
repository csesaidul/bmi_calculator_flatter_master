

import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableBMIResultCard extends StatelessWidget {
  final String resultText;
  final Color resultColor;
  final double bmiValue;
  final String interpretation;
  const ReusableBMIResultCard({
    super.key,
    required this.resultText,
    required this.bmiValue,
    required this.interpretation,
    required this.resultColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF212747),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText
                      .toUpperCase(), // This should be replaced with the actual BMI value
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: resultColor,
                  ),
                ),
                Text(
                  // "22.5"
                  bmiValue.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  interpretation, // This should be replaced with the actual BMI value
                  style: kLargeLabelTextStyle.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}