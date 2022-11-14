import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sound_share/ui/style/app_colors.dart';

class DefaultAppBar extends PreferredSize {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool elevated;
  final Color backgroundColor;

  DefaultAppBar(
      {Key? key,
      required this.title,
      this.actions,
      this.leading,
      this.elevated = true,
      this.backgroundColor = AppColors.primaryColor})
      : super(
            key: key,
            child: Container(),
            preferredSize: const Size.fromHeight(kToolbarHeight));

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: elevated ? 10 : 0,
        backgroundColor: backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          if (actions != null) ...actions!,
          const SizedBox(
            width: 8,
          )
        ],
        leading: leading,
        iconTheme: const IconThemeData(
          color: AppColors.white, //change your color here
        ),
        centerTitle: Theme.of(context).platform == TargetPlatform.iOS,
        title: Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: AppColors.white),
        ));
  }
}
