import 'package:flutter/material.dart';

class StyleValues {
  static const defaultRadius = BorderRadius.all(Radius.circular(32.0));

  static const defaultIconSize = 27.0;

  static List<BoxShadow> defaultShadow(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 18,
        ),
      ];
    } else {
      return [];
    }
  }
}
