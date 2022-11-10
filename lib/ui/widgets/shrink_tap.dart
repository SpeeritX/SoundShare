import 'package:async/async.dart';
import 'package:flutter/material.dart';

class ShrinkTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final HitTestBehavior? behavior;

  const ShrinkTap(
      {Key? key, required this.child, required this.onTap, this.behavior})
      : super(key: key);

  @override
  _ShrinkTapState createState() => _ShrinkTapState();
}

class _ShrinkTapState extends State<ShrinkTap> with TickerProviderStateMixin {
  static const _animationCurve = Curves.linear;
  static const _animationTime = Duration(milliseconds: 130);
  static const _tapScale = 0.97;

  late AnimationController _controller;
  late Animation<double> _animation;
  final double _scale = 1;

  CancelableOperation? _delayedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      value: _scale,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _delayedAnimation?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) {
      return widget.child;
    }
    return GestureDetector(
      behavior: widget.behavior,
      onTap: () => widget.onTap?.call(),
      onTapDown: (details) {
        _delayedAnimation?.cancel();
        _controller.animateTo(_tapScale,
            curve: _animationCurve, duration: _animationTime);
      },
      onTapCancel: () {
        _controller.animateTo(1,
            curve: _animationCurve, duration: _animationTime);
      },
      onTapUp: (details) {
        _delayedAnimation = CancelableOperation.fromFuture(
                Future.delayed(const Duration(milliseconds: 100)))
            .then((_) {
          _controller.animateTo(1,
              curve: _animationCurve, duration: _animationTime);
        });
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
