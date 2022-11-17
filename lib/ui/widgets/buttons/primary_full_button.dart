import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/style/style_values.dart';
import 'package:sound_share/ui/widgets/shrink_tap.dart';

class PrimaryFullButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool disable;
  final double? width;
  final Widget? child;
  final TextStyle? style;
  final bool shadow;
  final bool animation;

  const PrimaryFullButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.disable = false,
    this.width = double.infinity,
    this.child,
    this.style,
    this.shadow = true,
    this.animation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShrinkTap(
      onTap: () {
        if (!disable) onPressed();
      },
      shrinkScale: animation ? 0.97 : 1,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: StyleValues.defaultRadius,
          color: backgroundColor,
          boxShadow: shadow ? StyleValues.defaultShadow(context) : null,
        ),
        child: child ??
            Text(
              text,
              style: style ?? Theme.of(context).textTheme.button,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
