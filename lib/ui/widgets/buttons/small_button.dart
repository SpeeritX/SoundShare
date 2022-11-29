import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/widgets/shrink_tap.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final bool disable;
  final double? width;

  const SmallButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.disable = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShrinkTap(
      onTap: () {
        if (!disable) onPressed();
      },
      behavior: HitTestBehavior.translucent,
      shrinkScale: 0.85,
      child: Container(
          color: backgroundColor,
          padding: EdgeInsets.all(Paddings.dynamic.m1),
          alignment: Alignment.center,
          child: child),
    );
  }
}
