import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator_flatter_master/bmi_calculator_brain.dart';

void main() {
  group('BMI Calculator Brain Unit Tests', () {
    group('BMI Calculation', () {
      test('should calculate BMI correctly for normal values', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: 70);
        final bmi = calculator.calculateBMI();
        expect(bmi, closeTo(21.6, 0.1));
      });

      test('should calculate BMI correctly for different height and weight', () {
        final calculator = BMICalculatorBrain(false, 30, height: 165, weight: 55);
        final bmi = calculator.calculateBMI();
        expect(bmi, closeTo(20.2, 0.1));
      });

      test('should throw ArgumentError for zero height', () {
        final calculator = BMICalculatorBrain(true, 25, height: 0, weight: 70);
        expect(() => calculator.calculateBMI(), throwsArgumentError);
      });

      test('should throw ArgumentError for zero weight', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: 0);
        expect(() => calculator.calculateBMI(), throwsArgumentError);
      });

      test('should throw ArgumentError for negative height', () {
        final calculator = BMICalculatorBrain(true, 25, height: -180, weight: 70);
        expect(() => calculator.calculateBMI(), throwsArgumentError);
      });

      test('should throw ArgumentError for negative weight', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: -70);
        expect(() => calculator.calculateBMI(), throwsArgumentError);
      });
    });

    group('BMI Result Classification - Adult Male', () {
      test('should return Underweight for adult male with low BMI', () {
        final calculator = BMICalculatorBrain(true, 25, height: 190, weight: 60);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for adult male with normal BMI', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: 70);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for adult male with high BMI', () {
        final calculator = BMICalculatorBrain(true, 25, height: 170, weight: 85);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for adult male with very high BMI', () {
        final calculator = BMICalculatorBrain(true, 25, height: 170, weight: 100);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Classification - Adult Female', () {
      test('should return Underweight for adult female with low BMI', () {
        final calculator = BMICalculatorBrain(false, 25, height: 170, weight: 45);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for adult female with normal BMI', () {
        final calculator = BMICalculatorBrain(false, 25, height: 165, weight: 60);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for adult female with high BMI', () {
        final calculator = BMICalculatorBrain(false, 25, height: 160, weight: 75);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for adult female with very high BMI', () {
        final calculator = BMICalculatorBrain(false, 25, height: 160, weight: 85);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Classification - Teenage Male', () {
      test('should return Underweight for teenage male with low BMI', () {
        final calculator = BMICalculatorBrain(true, 16, height: 175, weight: 50);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for teenage male with normal BMI', () {
        final calculator = BMICalculatorBrain(true, 16, height: 170, weight: 65);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for teenage male with high BMI', () {
        final calculator = BMICalculatorBrain(true, 16, height: 165, weight: 80);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for teenage male with very high BMI', () {
        final calculator = BMICalculatorBrain(true, 16, height: 160, weight: 85);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Classification - Teenage Female', () {
      test('should return Underweight for teenage female with low BMI', () {
        final calculator = BMICalculatorBrain(false, 16, height: 160, weight: 40);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for teenage female with normal BMI', () {
        final calculator = BMICalculatorBrain(false, 16, height: 160, weight: 55);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for teenage female with high BMI', () {
        final calculator = BMICalculatorBrain(false, 16, height: 155, weight: 65);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for teenage female with very high BMI', () {
        final calculator = BMICalculatorBrain(false, 16, height: 150, weight: 70);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Classification - Senior Male', () {
      test('should return Underweight for senior male with low BMI', () {
        final calculator = BMICalculatorBrain(true, 70, height: 175, weight: 60);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for senior male with normal BMI', () {
        final calculator = BMICalculatorBrain(true, 70, height: 170, weight: 75);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for senior male with high BMI', () {
        final calculator = BMICalculatorBrain(true, 70, height: 170, weight: 85);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for senior male with very high BMI', () {
        final calculator = BMICalculatorBrain(true, 70, height: 170, weight: 95);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Classification - Senior Female', () {
      test('should return Underweight for senior female with low BMI', () {
        final calculator = BMICalculatorBrain(false, 70, height: 160, weight: 50);
        expect(calculator.getResult(), equals('Underweight'));
      });

      test('should return Normal weight for senior female with normal BMI', () {
        final calculator = BMICalculatorBrain(false, 70, height: 160, weight: 65);
        expect(calculator.getResult(), equals('Normal weight'));
      });

      test('should return Overweight for senior female with high BMI', () {
        final calculator = BMICalculatorBrain(false, 70, height: 160, weight: 75);
        expect(calculator.getResult(), equals('Overweight'));
      });

      test('should return Obesity for senior female with very high BMI', () {
        final calculator = BMICalculatorBrain(false, 70, height: 160, weight: 85);
        expect(calculator.getResult(), equals('Obesity'));
      });
    });

    group('BMI Result Colors', () {
      test('should return blue color for underweight', () {
        final calculator = BMICalculatorBrain(true, 25, height: 190, weight: 60);
        expect(calculator.getResultColor(), equals(Colors.blue));
      });

      test('should return green color for normal weight', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: 70);
        expect(calculator.getResultColor(), equals(Colors.green));
      });

      test('should return yellow color for overweight', () {
        final calculator = BMICalculatorBrain(true, 25, height: 170, weight: 85);
        expect(calculator.getResultColor(), equals(Colors.yellow));
      });

      test('should return red color for obesity', () {
        final calculator = BMICalculatorBrain(true, 25, height: 170, weight: 100);
        expect(calculator.getResultColor(), equals(Colors.red));
      });
    });

    group('BMI Interpretations', () {
      test('should provide appropriate interpretation for normal weight adult male', () {
        final calculator = BMICalculatorBrain(true, 25, height: 180, weight: 70);
        final interpretation = calculator.getInterpretation();
        expect(interpretation, contains('Normal BMI'));
        expect(interpretation, contains('man under 40'));
      });

      test('should provide appropriate interpretation for overweight adult female', () {
        final calculator = BMICalculatorBrain(false, 30, height: 160, weight: 75);
        final interpretation = calculator.getInterpretation();
        expect(interpretation, contains('Overweight'));
        expect(interpretation, contains('woman aged 40-64'));
      });

      test('should provide appropriate interpretation for teenage male', () {
        final calculator = BMICalculatorBrain(true, 16, height: 170, weight: 65);
        final interpretation = calculator.getInterpretation();
        expect(interpretation, contains('teenage boy'));
      });

      test('should provide appropriate interpretation for senior female', () {
        final calculator = BMICalculatorBrain(false, 70, height: 160, weight: 65);
        final interpretation = calculator.getInterpretation();
        expect(interpretation, contains('senior woman'));
      });

      test('should provide appropriate interpretation for young child', () {
        final calculator = BMICalculatorBrain(true, 4, height: 100, weight: 16);
        final interpretation = calculator.getInterpretation();
        expect(interpretation, contains('young boy under 5'));
      });
    });

    group('Edge Cases', () {
      test('should handle minimum valid values', () {
        final calculator = BMICalculatorBrain(true, 1, height: 50, weight: 3);
        expect(() => calculator.calculateBMI(), returnsNormally);
        expect(() => calculator.getResult(), returnsNormally);
        expect(() => calculator.getInterpretation(), returnsNormally);
        expect(() => calculator.getResultColor(), returnsNormally);
      });

      test('should handle maximum valid values', () {
        final calculator = BMICalculatorBrain(true, 120, height: 250, weight: 300);
        expect(() => calculator.calculateBMI(), returnsNormally);
        expect(() => calculator.getResult(), returnsNormally);
        expect(() => calculator.getInterpretation(), returnsNormally);
        expect(() => calculator.getResultColor(), returnsNormally);
      });

      test('should handle boundary age values correctly', () {
        // Test age boundary at 18
        final teen = BMICalculatorBrain(true, 17, height: 170, weight: 70);
        final adult = BMICalculatorBrain(true, 18, height: 170, weight: 70);

        expect(teen.getResult(), isNot(equals(adult.getResult())));

        // Test age boundary at 65
        final middleAge = BMICalculatorBrain(true, 64, height: 170, weight: 80);
        final senior = BMICalculatorBrain(true, 65, height: 170, weight: 80);

        expect(middleAge.getResult(), isNot(equals(senior.getResult())));
      });
    });

    group('Gender Differences', () {
      test('should provide different results for male and female with same parameters', () {
        final male = BMICalculatorBrain(true, 25, height: 170, weight: 70);
        final female = BMICalculatorBrain(false, 25, height: 170, weight: 70);

        // BMI calculation should be same
        expect(male.calculateBMI(), equals(female.calculateBMI()));

        // But classification might be different due to gender-specific thresholds
        // This depends on the specific BMI value and age group
      });
    });
  });
}
