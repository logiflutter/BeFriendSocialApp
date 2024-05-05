import 'package:flutter/material.dart';

class AppControlSlideTrandision extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final Curve? curve;
  final Offset? begin;
  final Offset? end;
  final bool? isRepeat;
  
  const AppControlSlideTrandision(this.child,
      {super.key,
      this.duration = const Duration(milliseconds: 500),
      this.begin = const Offset(0.0, 2.0),
      this.end = Offset.zero,
      this.curve = Curves.bounceOut,
      this.isRepeat = false});
  @override
  State<AppControlSlideTrandision> createState() =>
      _AppControlSlideTrandision();
}

class _AppControlSlideTrandision extends State<AppControlSlideTrandision>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<Offset>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve!));

    widget.isRepeat!
        ? _controller.repeat(reverse: true)
        : _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
