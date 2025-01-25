import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const CustomCard({super.key, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sh,
      padding: padding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Styles.TICKET_COLOR, width: 0.5),
      ),
      child: child,
    );
  }
}
