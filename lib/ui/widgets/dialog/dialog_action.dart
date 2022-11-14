import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/app_colors.dart';

enum DialogActionType { primary, neutral, destructive }

extension DialogActionTypeExtension on DialogActionType {
  Color color(BuildContext context) {
    switch (this) {
      case DialogActionType.primary:
        return AppColors.primaryColor;
      case DialogActionType.neutral:
        return Theme.of(context).hintColor;
      case DialogActionType.destructive:
        return AppColors.red;
    }
  }
}

class DialogAction {
  final VoidCallback onSelected;
  final DialogActionType type;
  final String text;

  DialogAction({
    required this.text,
    required this.type,
    required this.onSelected,
  });
}
