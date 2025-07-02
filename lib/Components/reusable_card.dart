import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  final Color color;
  final Widget? childWidget;
  final GestureTapCallback? onPress;
  const ReUsableCard({super.key, required this.color, this.childWidget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: childWidget,
      ),
    );
  }
}