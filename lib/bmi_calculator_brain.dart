import 'package:flutter/material.dart';

class BMICalculatorBrain {
  /// The arguments required to calculate BMI:
  final int height; // in cm
  final int weight; // in kg
  final bool isMale; // true
  final int age; // in years

  /// Constructor to initialize the BMI
  BMICalculatorBrain(
    this.isMale,
    this.age, {
    required this.height,
    required this.weight,
  });

  /// Calculates the Body Mass Index (BMI) based on height and weight.
  double calculateBMI() {
    if (height <= 0 || weight <= 0) {
      throw ArgumentError('Height and weight must be greater than zero.');
    }
    return weight / ((height / 100) * (height / 100));
  }

  /// Returns the BMI result based on
  String getResult() {
    double bmi = calculateBMI();

    if (age < 18) {
      // Children/Teenagers
      if (isMale) {
        if (bmi < 17.5) {
          return 'Underweight';
        } else if (bmi < 23.0) {
          return 'Normal weight';
        } else if (bmi < 28.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      } else {
        if (bmi < 17.0) {
          return 'Underweight';
        } else if (bmi < 22.5) {
          return 'Normal weight';
        } else if (bmi < 27.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      }
    } else if (age < 65) {
      // Adults
      if (isMale) {
        if (bmi < 20.0) {
          return 'Underweight';
        } else if (bmi < 25.0) {
          return 'Normal weight';
        } else if (bmi < 30.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      } else {
        if (bmi < 18.5) {
          return 'Underweight';
        } else if (bmi < 24.0) {
          return 'Normal weight';
        } else if (bmi < 29.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      }
    } else {
      // Seniors
      if (isMale) {
        if (bmi < 22.0) {
          return 'Underweight';
        } else if (bmi < 27.0) {
          return 'Normal weight';
        } else if (bmi < 30.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      } else {
        if (bmi < 21.0) {
          return 'Underweight';
        } else if (bmi < 26.0) {
          return 'Normal weight';
        } else if (bmi < 30.0) {
          return 'Overweight';
        } else {
          return 'Obesity';
        }
      }
    }
  }

  /// Returns a string interpretation of the BMI result.
  String getInterpretation() {
    double bmi = calculateBMI();

    if (age < 5) {
      if (isMale) {
        if (bmi < 15.5) {
          return 'As a young boy under 5, your BMI is considered low. Ensure a nutrient-rich diet and regular pediatric checkups.';
        } else if (bmi < 18.0) {
          return 'Healthy BMI for a boy under 5. Keep encouraging active play and balanced meals.';
        } else if (bmi < 20.0) {
          return 'Slightly high BMI for a boy under 5. Monitor portion sizes and promote outdoor activities.';
        } else {
          return 'High BMI for a boy under 5. Consult a pediatrician for tailored advice on nutrition and activity.';
        }
      } else {
        if (bmi < 15.0) {
          return 'As a young girl under 5, your BMI is low. Focus on a varied, nutritious diet and regular health checks.';
        } else if (bmi < 17.5) {
          return 'Healthy BMI for a girl under 5. Maintain good eating habits and active play.';
        } else if (bmi < 19.5) {
          return 'Slightly high BMI for a girl under 5. Encourage more physical activity and balanced meals.';
        } else {
          return 'High BMI for a girl under 5. Seek pediatric guidance for healthy growth.';
        }
      }
    } else if (age < 13) {
      if (isMale) {
        if (bmi < 16.5) {
          return 'For a boy aged 5-12, your BMI is below average. Ensure adequate calorie intake and growth monitoring.';
        } else if (bmi < 21.0) {
          return 'Normal BMI for a boy aged 5-12. Support healthy eating and regular exercise.';
        } else if (bmi < 25.0) {
          return 'Slightly above average BMI for a boy aged 5-12. Encourage more activity and mindful eating.';
        } else {
          return 'High BMI for a boy aged 5-12. Consult a healthcare provider for personalized advice.';
        }
      } else {
        if (bmi < 16.0) {
          return 'For a girl aged 5-12, your BMI is low. Focus on nutrition and regular growth assessments.';
        } else if (bmi < 20.5) {
          return 'Normal BMI for a girl aged 5-12. Maintain a healthy lifestyle and physical activity.';
        } else if (bmi < 24.0) {
          return 'Slightly high BMI for a girl aged 5-12. Promote active play and balanced meals.';
        } else {
          return 'High BMI for a girl aged 5-12. Seek advice from a pediatrician for healthy development.';
        }
      }
    } else if (age < 18) {
      if (isMale) {
        if (bmi < 17.5) {
          return 'Teenage boys with BMI below 17.5 may be underweight. Consider consulting a doctor for a growth plan.';
        } else if (bmi < 23.0) {
          return 'Healthy BMI for a teenage boy. Keep up with sports and nutritious meals.';
        } else if (bmi < 28.0) {
          return 'Slightly high BMI for a teenage boy. Increase physical activity and monitor diet.';
        } else {
          return 'Obese range for a teenage boy. Medical advice is recommended for safe weight management.';
        }
      } else {
        if (bmi < 17.0) {
          return 'Teenage girls with BMI below 17.0 may be underweight. Discuss with a healthcare provider for guidance.';
        } else if (bmi < 22.5) {
          return 'Healthy BMI for a teenage girl. Continue healthy eating and regular exercise.';
        } else if (bmi < 27.0) {
          return 'Slightly high BMI for a teenage girl. Encourage more activity and balanced nutrition.';
        } else {
          return 'Obese range for a teenage girl. Consult a doctor for a personalized health plan.';
        }
      }
    } else if (age < 40) {
      if (isMale) {
        if (bmi < 20.0) {
          return 'Adult men under 40 with BMI below 20.0 are underweight. Consider a calorie-rich, balanced diet.';
        } else if (bmi < 25.0) {
          return 'Normal BMI for a man under 40. Maintain your healthy habits!';
        } else if (bmi < 30.0) {
          return 'Overweight for a man under 40. Increase exercise and review your diet.';
        } else {
          return 'Obese range for a man under 40. Seek medical advice for weight management.';
        }
      } else {
        if (bmi < 18.5) {
          return 'Adult women under 40 with BMI below 18.5 are underweight. Focus on nutrition and strength-building activities.';
        } else if (bmi < 24.0) {
          return 'Normal BMI for a woman under 40. Keep up the good work!';
        } else if (bmi < 29.0) {
          return 'Overweight for a woman under 40. Consider more physical activity and healthy eating.';
        } else {
          return 'Obese range for a woman under 40. Consult a healthcare provider for support.';
        }
      }
    } else if (age < 65) {
      if (isMale) {
        if (bmi < 21.0) {
          return 'Men aged 40-64 with BMI below 21.0 are underweight. Monitor for unintentional weight loss and consult a doctor.';
        } else if (bmi < 26.0) {
          return 'Healthy BMI for a man aged 40-64. Continue regular checkups and active living.';
        } else if (bmi < 30.0) {
          return 'Overweight for a man aged 40-64. Focus on heart-healthy foods and regular exercise.';
        } else {
          return 'Obese range for a man aged 40-64. Medical guidance is recommended for weight control.';
        }
      } else {
        if (bmi < 19.5) {
          return 'Women aged 40-64 with BMI below 19.5 are underweight. Ensure adequate nutrition and consult your doctor.';
        } else if (bmi < 25.0) {
          return 'Healthy BMI for a woman aged 40-64. Maintain your healthy lifestyle!';
        } else if (bmi < 29.0) {
          return 'Overweight for a woman aged 40-64. Increase activity and review your diet.';
        } else {
          return 'Obese range for a woman aged 40-64. Seek medical advice for a tailored plan.';
        }
      }
    } else {
      if (isMale) {
        if (bmi < 22.0) {
          return 'Senior men (65+) with BMI below 22.0 may be underweight. Monitor for frailty and consult your doctor.';
        } else if (bmi < 27.0) {
          return 'Healthy BMI for a senior man. Stay active and eat a balanced diet.';
        } else if (bmi < 30.0) {
          return 'Overweight for a senior man. Focus on gentle exercise and portion control.';
        } else {
          return 'Obese range for a senior man. Medical advice is recommended for safe weight management.';
        }
      } else {
        if (bmi < 21.0) {
          return 'Senior women (65+) with BMI below 21.0 may be underweight. Ensure proper nutrition and regular checkups.';
        } else if (bmi < 26.0) {
          return 'Healthy BMI for a senior woman. Maintain your healthy habits!';
        } else if (bmi < 30.0) {
          return 'Overweight for a senior woman. Gentle activity and balanced meals are important.';
        } else {
          return 'Obese range for a senior woman. Consult your healthcare provider for guidance.';
        }
      }
    }
  }

  /// Returns result color based on BMI value.
  Color getResultColor() {
    double bmi = calculateBMI();

    if (age < 18) {
      if (isMale) {
        if (bmi < 17.5) return Colors.blue;
        if (bmi < 23.0) return Colors.green;
        if (bmi < 28.0) return Colors.yellow;
        return Colors.red;
      } else {
        if (bmi < 17.0) return Colors.blue;
        if (bmi < 22.5) return Colors.green;
        if (bmi < 27.0) return Colors.yellow;
        return Colors.red;
      }
    } else if (age < 65) {
      if (isMale) {
        if (bmi < 20.0) return Colors.blue;
        if (bmi < 25.0) return Colors.green;
        if (bmi < 30.0) return Colors.yellow;
        return Colors.red;
      } else {
        if (bmi < 18.5) return Colors.blue;
        if (bmi < 24.0) return Colors.green;
        if (bmi < 29.0) return Colors.yellow;
        return Colors.red;
      }
    } else {
      if (isMale) {
        if (bmi < 22.0) return Colors.blue;
        if (bmi < 27.0) return Colors.green;
        if (bmi < 30.0) return Colors.yellow;
        return Colors.red;
      } else {
        if (bmi < 21.0) return Colors.blue;
        if (bmi < 26.0) return Colors.green;
        if (bmi < 30.0) return Colors.yellow;
        return Colors.red;
      }
    }
  }
}
