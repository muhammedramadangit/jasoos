import 'package:flutter/material.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomCenterText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  const CustomCenterText(this.text, {super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.w500.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
