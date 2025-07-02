import 'package:bmi_calculator_flatter_master/Screens/result_page.dart';
import 'package:bmi_calculator_flatter_master/bmi_calculator_brain.dart';
import 'package:flutter/material.dart';

import 'Screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 6,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ResultPage(
            bmiCalculatorBrain: BMICalculatorBrain(
              args['selectedGender'] == Gender.male,
              args['age'],
              height: args['height'],
              weight: args['weight'],
            ),
          );
        },
      },
    );
  }
}
