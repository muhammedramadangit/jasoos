import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/media_quary_helper.dart';

class CustomTaskCard extends StatelessWidget {
  final Widget? child;
  final bool? isDotted;
  const CustomTaskCard({super.key, this.child, this.isDotted});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 550.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(isDotted == true)...[
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.blueAccent,
                  strokeWidth: 2,
                  radius: Radius.circular(12),
                  dashPattern: [6, 3],
                  child: Container(
                    width: MediaQueryHelper.width,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(0xff282928).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                    ),
                    child: child,
                  ),
                ),
              ]else...[
                Container(
                  width: MediaQueryHelper.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xff282928).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  child: child,
                ),
              ],
              Container(
                width: MediaQueryHelper.width,
                height: 12.h,
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Color(0xff282928).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
