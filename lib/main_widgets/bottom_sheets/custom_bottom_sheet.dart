import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';

showCustomBottomSheet(context, {Widget? child}) => showModalBottomSheet(
  isScrollControlled: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
  ),
  backgroundColor: Styles.WHITE_COLOR,
  context: context,
  builder: (context) => CustomBottomSheet(child: child),
);

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: MediaQueryHelper.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Styles.GREY_COLOR,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                ),
                SizedBox(height: 24.h),
                child ?? SizedBox(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}