import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimation extends StatelessWidget {
  final Widget? child;
  final double? verticalOffset;
  final double? horizontalOffset;
  final double? duration;

  const CustomAnimation(
      {Key? key, this.child, this.verticalOffset, this.horizontalOffset, this.duration,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: Duration(milliseconds: duration?.toInt() ?? 500),
      child: SlideAnimation(
        horizontalOffset: horizontalOffset ?? 0,
        verticalOffset: verticalOffset ?? 0,
        child: FadeInAnimation(
          child: child!,
        ),
      ),
    );
  }
}