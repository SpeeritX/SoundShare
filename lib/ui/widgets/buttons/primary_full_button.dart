import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/app_colors.dart';

class PrimaryFullButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const PrimaryFullButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: child,
    );
  }
}
