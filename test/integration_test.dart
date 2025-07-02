import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator_flatter_master/main.dart';

void main() {
  group('Integration Tests', () {
    group('Complete User Flow', () {
      testWidgets('should complete full BMI calculation flow - Male Adult', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Step 1: Verify initial state
        expect(find.text('BMI CALCULATOR'), findsOneWidget);
        expect(find.text('180'), findsOneWidget); // Default height
        expect(find.text('60'), findsOneWidget);  // Default weight
        expect(find.text('20'), findsOneWidget);  // Default age

        // Step 2: Select Male gender
        await tester.tap(find.text('MALE'));
        await tester.pump();

        // Step 3: Adjust height using slider
        final slider = find.byType(Slider);
        await tester.drag(slider, const Offset(20, 0)); // Increase height slightly
        await tester.pump();

        // Step 4: Adjust weight
        final weightIncrement = find.byIcon(Icons.add).first;
        for (int i = 0; i < 10; i++) { // Add 10kg
          await tester.tap(weightIncrement);
          await tester.pump();
        }
        expect(find.text('70'), findsOneWidget);

        // Step 5: Adjust age
        final ageIncrement = find.byIcon(Icons.add).last;
        for (int i = 0; i < 5; i++) { // Add 5 years
          await tester.tap(ageIncrement);
          await tester.pump();
        }
        expect(find.text('25'), findsOneWidget);

        // Step 6: Calculate BMI
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Step 7: Verify result page
        expect(find.text('Your Result'), findsOneWidget);
        expect(find.text('RE-CALCULATE'), findsOneWidget);

        // Should display BMI value and category
        expect(find.textContaining('.'), findsOneWidget); // BMI value with decimal
        expect(find.textContaining('weight'), findsOneWidget); // Some weight category

        // Step 8: Return to input page
        await tester.tap(find.text('RE-CALCULATE'));
        await tester.pumpAndSettle();

        // Should be back on input page
        expect(find.text('BMI CALCULATOR'), findsOneWidget);
      });

      testWidgets('should complete full BMI calculation flow - Female Adult', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select Female gender
        await tester.tap(find.text('FEMALE'));
        await tester.pump();

        // Adjust parameters for typical female adult
        // Decrease weight
        final weightDecrement = find.byIcon(Icons.remove).first;
        for (int i = 0; i < 5; i++) {
          await tester.tap(weightDecrement);
          await tester.pump();
        }

        // Increase age to 30
        final ageIncrement = find.byIcon(Icons.add).last;
        for (int i = 0; i < 10; i++) {
          await tester.tap(ageIncrement);
          await tester.pump();
        }

        // Calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Verify result page appears
        expect(find.text('Your Result'), findsOneWidget);
        expect(find.textContaining('woman'), findsOneWidget); // Gender-specific interpretation
      });

      testWidgets('should handle teenage user flow', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select Male gender
        await tester.tap(find.text('MALE'));
        await tester.pump();

        // Set age to teenager (16)
        final ageDecrement = find.byIcon(Icons.remove).last;
        for (int i = 0; i < 4; i++) { // 20 - 4 = 16
          await tester.tap(ageDecrement);
          await tester.pump();
        }
        expect(find.text('16'), findsOneWidget);

        // Adjust height for teenager
        final slider = find.byType(Slider);
        await tester.drag(slider, const Offset(-30, 0)); // Decrease height

        // Calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Verify teenage-specific interpretation
        expect(find.text('Your Result'), findsOneWidget);
        expect(find.textContaining('teenage'), findsOneWidget);
      });

      testWidgets('should handle senior user flow', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select Female gender
        await tester.tap(find.text('FEMALE'));
        await tester.pump();

        // Set age to senior (70)
        final ageIncrement = find.byIcon(Icons.add).last;
        for (int i = 0; i < 50; i++) { // 20 + 50 = 70
          await tester.tap(ageIncrement);
          await tester.pump();
        }
        expect(find.text('70'), findsOneWidget);

        // Calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Verify senior-specific interpretation
        expect(find.text('Your Result'), findsOneWidget);
        expect(find.textContaining('Senior'), findsOneWidget);
      });
    });

    group('Error Handling and Edge Cases', () {
      testWidgets('should prevent calculation without gender selection', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Try to calculate without selecting gender
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Should remain on input page
        expect(find.text('BMI CALCULATOR'), findsOneWidget);
        expect(find.text('Your Result'), findsNothing);
      });

      testWidgets('should handle minimum weight boundary', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select gender
        await tester.tap(find.text('MALE'));
        await tester.pump();

        // Decrease weight to minimum
        final weightDecrement = find.byIcon(Icons.remove).first;
        for (int i = 0; i < 60; i++) { // Should stop at 10
          await tester.tap(weightDecrement);
          await tester.pump();
        }

        expect(find.text('10'), findsOneWidget);

        // Should still be able to calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });

      testWidgets('should handle maximum weight boundary', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select gender
        await tester.tap(find.text('FEMALE'));
        await tester.pump();

        // Increase weight to maximum
        final weightIncrement = find.byIcon(Icons.add).first;
        for (int i = 0; i < 250; i++) { // Should stop at 300
          await tester.tap(weightIncrement);
          await tester.pump();
        }

        expect(find.text('300'), findsOneWidget);

        // Should still be able to calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });

      testWidgets('should handle minimum age boundary', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select gender
        await tester.tap(find.text('MALE'));
        await tester.pump();

        // Decrease age to minimum
        final ageDecrement = find.byIcon(Icons.remove).last;
        for (int i = 0; i < 25; i++) { // Should stop at 1
          await tester.tap(ageDecrement);
          await tester.pump();
        }

        expect(find.text('1'), findsOneWidget);

        // Should still be able to calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });

      testWidgets('should handle maximum age boundary', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Select gender
        await tester.tap(find.text('FEMALE'));
        await tester.pump();

        // Increase age to maximum
        final ageIncrement = find.byIcon(Icons.add).last;
        for (int i = 0; i < 105; i++) { // Should stop at 120
          await tester.tap(ageIncrement);
          await tester.pump();
        }

        expect(find.text('120'), findsOneWidget);

        // Should still be able to calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });
    });

    group('Multiple Calculations', () {
      testWidgets('should allow multiple calculations in sequence', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // First calculation
        await tester.tap(find.text('MALE'));
        await tester.pump();
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);

        // Return to input
        await tester.tap(find.text('RE-CALCULATE'));
        await tester.pumpAndSettle();

        // Change parameters and calculate again
        await tester.tap(find.text('FEMALE'));
        await tester.pump();

        // Adjust weight
        final weightIncrement = find.byIcon(Icons.add).first;
        await tester.tap(weightIncrement);
        await tester.pump();

        // Second calculation
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });
    });

    group('UI State Persistence', () {
      testWidgets('should maintain input values during navigation', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Set specific values
        await tester.tap(find.text('MALE'));
        await tester.pump();

        // Adjust weight to 75
        final weightIncrement = find.byIcon(Icons.add).first;
        for (int i = 0; i < 15; i++) {
          await tester.tap(weightIncrement);
          await tester.pump();
        }

        // Adjust age to 30
        final ageIncrement = find.byIcon(Icons.add).last;
        for (int i = 0; i < 10; i++) {
          await tester.tap(ageIncrement);
          await tester.pump();
        }

        expect(find.text('75'), findsOneWidget);
        expect(find.text('30'), findsOneWidget);

        // Calculate
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        // Return to input
        await tester.tap(find.text('RE-CALCULATE'));
        await tester.pumpAndSettle();

        // Values should be maintained
        expect(find.text('75'), findsOneWidget);
        expect(find.text('30'), findsOneWidget);
      });
    });

    group('Performance Tests', () {
      testWidgets('should handle rapid button taps without errors', (WidgetTester tester) async {
        await tester.pumpWidget(BMICalculator());

        // Rapidly tap weight increment button
        final weightIncrement = find.byIcon(Icons.add).first;
        for (int i = 0; i < 20; i++) {
          await tester.tap(weightIncrement);
          // Don't pump between taps to simulate rapid tapping
        }
        await tester.pump();

        // Should handle all taps and display final value
        expect(find.text('80'), findsOneWidget);

        // App should still be functional
        await tester.tap(find.text('MALE'));
        await tester.pump();
        await tester.tap(find.text('CALCULATE'));
        await tester.pumpAndSettle();

        expect(find.text('Your Result'), findsOneWidget);
      });
    });
  });
}
