import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/paddings.dart';

class AppConfigurationWidget extends StatefulWidget {
  final Widget child;

  const AppConfigurationWidget({required this.child, Key? key})
      : super(key: key);

  @override
  State<AppConfigurationWidget> createState() => _AppConfigurationWidgetState();
}

class _AppConfigurationWidgetState extends State<AppConfigurationWidget> {
  var _initialized = false;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) {
      return;
    }
    _initialized = true;
    Paddings.init(context);
  }
}
