import 'package:flutter/material.dart';

class PrimaryDivider extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? margin;

  const PrimaryDivider({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      color: Theme.of(context).dividerColor,
    );
  }
}
