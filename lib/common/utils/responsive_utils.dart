import 'package:flutter/cupertino.dart';

class ResponsiveUtils {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 350;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 600;
  }
}
