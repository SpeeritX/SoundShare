import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:sound_share/domain/music/synchronization/play_synchronizer.dart';
import 'package:sound_share/domain/network/p2p/synchronized_clock.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/widgets/buttons/small_button.dart';

class PlayerScreenTimer extends StatefulWidget {
  const PlayerScreenTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreenTimer> createState() => _PlayerScreenTimerState();
}

class _PlayerScreenTimerState extends State<PlayerScreenTimer>
    with SingleTickerProviderStateMixin {
  final timeFormat = DateFormat('HH:mm:ss:SSS');
  late final Ticker _ticker;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {});
    });
    _ticker.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "Play offset: ${(PlaySynchronizer.instance.playOffset + PlaySynchronizer.instance.measuredOffset).inMilliseconds}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildModifyOffsetButton("<<", const Duration(milliseconds: -50)),
            _buildModifyOffsetButton("<", const Duration(milliseconds: -5)),
            _buildModifyOffsetButton(
                "#", -PlaySynchronizer.instance.playOffset),
            _buildModifyOffsetButton(">", const Duration(milliseconds: 5)),
            _buildModifyOffsetButton(">>", const Duration(milliseconds: 50)),
          ],
        ),
        SizedBox(height: Paddings.dynamic.m3),
        Text(
            "Clock offset: ${SynchronizedClock.instance.clockOffset.inMilliseconds}"),
        Text(
          timeFormat.format(SynchronizedClock.now()),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: 'Roboto',
              ),
        ),
      ],
    );
  }

  Widget _buildModifyOffsetButton(String text, Duration offset) {
    return SmallButton(
      onPressed: () {
        PlaySynchronizer.instance.playOffset += offset;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
