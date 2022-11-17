import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sound_share/ui/style/app_colors.dart';

class PlayerWidget extends StatefulWidget {
  static const FaIcon playIcon = FaIcon(
    FontAwesomeIcons.play,
    color: Colors.white,
    size: 25.0,
  );

  static const FaIcon pauseIcon = FaIcon(
    FontAwesomeIcons.pause,
    color: Colors.white,
    size: 25.0,
  );

  const PlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(child: _buildButtons()),
          ),
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(39), // Image radius
              child: Image.asset('assets/Music.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(
        left: 90,
        top: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Song name name name",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 3),
                ),
                Text(
                  "Girl",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffb833),
                      height: 1.0),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                // toggle = !toggle;
              },
              icon: const FaIcon(
                FontAwesomeIcons.backward,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });
              },
              icon: !toggle ? PlayerWidget.playIcon : PlayerWidget.pauseIcon,
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                // toggle = !toggle;
              },
              icon: const FaIcon(
                FontAwesomeIcons.forward,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
