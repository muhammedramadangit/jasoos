import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String? subTitle;
  final bool? isSuccess;
  final String? image;
  const CustomAlertDialog(this.title, {this.subTitle, Key? key, this.isSuccess, this.image}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => CustomNavigator.pop());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide.none),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SvgPicture.asset(
                widget.isSuccess == true ? Constants.getSvg("success") : Constants.getSvg("error"),
                height: 90.h,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.w700.copyWith(fontSize: 16),
            ),

            if(widget.subTitle != null)...[
              SizedBox(height: 12.h),
              Text(
                widget.subTitle ?? "",
                textAlign: TextAlign.center,
                style: AppTextStyles.w500.copyWith(fontSize: 13),
              ),
            ],
          ],
        ),
      ),
    );
  }
}