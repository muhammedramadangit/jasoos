import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  final Color? color;
  final EdgeInsets? padding;
  const CustomLoading({this.size, this.padding, super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: padding,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? Styles.PRIMARY_COLOR,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
