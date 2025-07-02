import 'package:flutter/material.dart';

import '../constants.dart';

class RoundCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const RoundCircleButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 6,
      fillColor: Color(0xFF212747),
      shape: CircleBorder(),
      child: Icon(icon, size: 30, color: kIconColor),
    );
  }
}