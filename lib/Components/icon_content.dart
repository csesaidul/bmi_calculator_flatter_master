import 'package:flutter/material.dart';

import '../constants.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: kLargeIconSize, color: kIconColor),
        kVerticalSpace,
        Text(
          label.toUpperCase(),
          style: kLevelTextStyle,
        ),
      ],
    );
  }
}
