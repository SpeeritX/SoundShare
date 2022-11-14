import 'package:flutter/material.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/style/style_values.dart';
import 'package:sound_share/ui/widgets/dialog/dialog_action.dart';
import 'package:sound_share/ui/widgets/dialog/dialog_button.dart';
import 'package:sound_share/ui/widgets/primary_divider.dart';

class DefaultAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final List<DialogAction> actions;

  const DefaultAlertDialog({
    Key? key,
    this.title,
    this.body,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.all(Paddings.static.m1),
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
              child: title!,
            ),
          ),
        if (body != null && title != null) SizedBox(height: Paddings.static.m2),
        if (body != null)
          DefaultTextStyle(
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
            child: body ?? Container(),
          ),
      ],
    );

    return Dialog(
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: StyleValues.defaultRadius,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (body != null || title != null)
              Padding(
                padding: EdgeInsets.all(Paddings.static.m2),
                child: content,
              ),
            if (actions.length == 1)
              _buildSingleButton(actions[0])
            else if (actions.length == 2)
              _buildTwoButtons(actions[0], actions[1])
            else
              _buildMultipleButtons(actions),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleButton(DialogAction action) {
    return Column(
      children: [
        const PrimaryDivider(height: 1),
        DialogButton(action: action),
      ],
    );
  }

  Widget _buildTwoButtons(DialogAction leftAction, DialogAction rightAction) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PrimaryDivider(height: 1),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DialogButton(action: leftAction),
              ),
              PrimaryDivider(
                width: 1,
                margin: EdgeInsets.symmetric(vertical: Paddings.static.m2),
              ),
              Expanded(
                child: DialogButton(action: rightAction),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMultipleButtons(List<DialogAction> actions) {
    return Column(
      children: actions.expand((action) {
        return [
          const PrimaryDivider(height: 1),
          DialogButton(action: action),
        ];
      }).toList(),
    );
  }
}
