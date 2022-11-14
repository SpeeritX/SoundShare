import 'package:flutter/material.dart';
import 'package:sound_share/ui/widgets/dialog/dialog_action.dart';

class DialogButton extends StatefulWidget {
  final DialogAction action;

  const DialogButton({Key? key, required this.action}) : super(key: key);

  @override
  _DialogButtonState createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  late Color pressedColor = Theme.of(context).dividerColor;
  static const releasedColor = Colors.transparent;

  Color _backgroundColor = releasedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.action.onSelected();
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          _backgroundColor = releasedColor;
        });
      },
      onTapCancel: () {
        setState(() {
          _backgroundColor = releasedColor;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _backgroundColor = pressedColor;
        });
      },
      child: ColoredBox(
        color: _backgroundColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 50),
          child: Center(
            child: Text(
              widget.action.text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: widget.action.type.color(context)),
            ),
          ),
        ),
      ),
    );
  }
}
