import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator_flatter_master/Components/reusable_card.dart';
import 'package:bmi_calculator_flatter_master/Components/icon_content.dart';
import 'package:bmi_calculator_flatter_master/Components/bottom_button.dart';
import 'package:bmi_calculator_flatter_master/Components/round_circle_button.dart';
import 'package:bmi_calculator_flatter_master/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  group('Component Tests', () {
    group('ReUsableCard', () {
      testWidgets('should render with child widget', (WidgetTester tester) async {
        const testChild = Text('Test Content');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ReUsableCard(
                color: kActiveCardColor,
                childWidget: testChild,
              ),
            ),
          ),
        );

        expect(find.text('Test Content'), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
      });

      testWidgets('should handle tap when onPress is provided', (WidgetTester tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ReUsableCard(
                color: kActiveCardColor,
                childWidget: const Text('Tap me'),
                onPress: () {
                  tapped = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(ReUsableCard));
        expect(tapped, isTrue);
      });

      testWidgets('should display correct background color', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ReUsableCard(
                color: kActiveCardColor,
                childWidget: const Text('Test'),
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(kActiveCardColor));
      });
    });

    group('IconContent', () {
      testWidgets('should display icon and label', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
              ),
            ),
          ),
        );

        expect(find.text('MALE'), findsOneWidget);
        expect(find.byIcon(FontAwesomeIcons.mars), findsOneWidget);
      });

      testWidgets('should apply correct text style', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('FEMALE'));
        expect(textWidget.style, equals(kLevelTextStyle));
      });
    });

    group('BottomButton', () {
      testWidgets('should display button text', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BottomButton(
                label: 'CALCULATE',
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.text('CALCULATE'), findsOneWidget);
      });

      testWidgets('should handle tap events', (WidgetTester tester) async {
        bool buttonTapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BottomButton(
                label: 'TEST BUTTON',
                onTap: () {
                  buttonTapped = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(BottomButton));
        expect(buttonTapped, isTrue);
      });

      testWidgets('should have correct styling', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BottomButton(
                label: 'STYLE TEST',
                onTap: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.constraints?.minHeight, equals(kBottomContainerHeight));
        expect(container.color, equals(kBottomContainerColor));
      });
    });

    group('RoundCircleButton', () {
      testWidgets('should display correct icon', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RoundCircleButton(
                icon: Icons.add,
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.add), findsOneWidget);
      });

      testWidgets('should handle press events', (WidgetTester tester) async {
        bool buttonPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RoundCircleButton(
                icon: Icons.remove,
                onTap: () {
                  buttonPressed = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(RoundCircleButton));
        expect(buttonPressed, isTrue);
      });

      testWidgets('should have circular shape', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RoundCircleButton(
                icon: Icons.add,
                onTap: () {},
              ),
            ),
          ),
        );

        final rawMaterialButton = tester.widget<RawMaterialButton>(
          find.byType(RawMaterialButton),
        );
        expect(rawMaterialButton.shape, isA<CircleBorder>());
      });

      testWidgets('should have correct size constraints', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RoundCircleButton(
                icon: Icons.add,
                onTap: () {},
              ),
            ),
          ),
        );

        final rawMaterialButton = tester.widget<RawMaterialButton>(
          find.byType(RawMaterialButton),
        );
        expect(rawMaterialButton.constraints.minWidth, equals(56.0));
        expect(rawMaterialButton.constraints.minHeight, equals(56.0));
      });
    });

    group('Component Integration', () {
      testWidgets('should work together in a typical layout', (WidgetTester tester) async {
        bool cardTapped = false;
        bool buttonPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  ReUsableCard(
                    color: kActiveCardColor,
                    childWidget: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      cardTapped = true;
                    },
                  ),
                  Row(
                    children: [
                      RoundCircleButton(
                        icon: Icons.remove,
                        onTap: () {
                          buttonPressed = true;
                        },
                      ),
                      RoundCircleButton(
                        icon: Icons.add,
                        onTap: () {
                          buttonPressed = true;
                        },
                      ),
                    ],
                  ),
                  BottomButton(
                    label: 'CALCULATE',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );

        // Test card tap
        await tester.tap(find.byType(ReUsableCard));
        expect(cardTapped, isTrue);

        // Test button press
        await tester.tap(find.byIcon(Icons.add));
        expect(buttonPressed, isTrue);

        // Verify all components are present
        expect(find.text('MALE'), findsOneWidget);
        expect(find.text('CALCULATE'), findsOneWidget);
        expect(find.byIcon(Icons.add), findsOneWidget);
        expect(find.byIcon(Icons.remove), findsOneWidget);
        expect(find.byIcon(FontAwesomeIcons.mars), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('components should be accessible', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Semantics(
                    button: true,
                    label: 'Male gender selection',
                    child: ReUsableCard(
                      color: kActiveCardColor,
                      childWidget: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      onPress: () {},
                    ),
                  ),
                  Semantics(
                    button: true,
                    label: 'Increase weight',
                    child: RoundCircleButton(
                      icon: Icons.add,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Verify semantic labels are present
        expect(find.bySemanticsLabel('Male gender selection'), findsOneWidget);
        expect(find.bySemanticsLabel('Increase weight'), findsOneWidget);
      });
    });

    group('Edge Cases', () {
      testWidgets('components should handle null onPress gracefully', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ReUsableCard(
                color: kActiveCardColor,
                childWidget: const Text('No tap handler'),
                // onPress is null
              ),
            ),
          ),
        );

        // Should not throw when tapped
        await tester.tap(find.byType(ReUsableCard));
        await tester.pump();

        expect(find.text('No tap handler'), findsOneWidget);
      });

      testWidgets('should handle very long text labels', (WidgetTester tester) async {
        const longText = 'This is a very long text that might overflow the available space';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IconContent(
                icon: FontAwesomeIcons.mars,
                label: longText,
              ),
            ),
          ),
        );

        expect(find.text(longText), findsOneWidget);
        // Verify no overflow errors
        expect(tester.takeException(), isNull);
      });
    });
  });
}
