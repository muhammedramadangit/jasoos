import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.borderColor,
      this.radius,
      this.text,
      this.color,
      this.txtColor,
      this.txtWeight,
      this.loading = false,
      this.loadingSize,
      this.txtFontSize,
      this.gradient,
      this.onTap,
      this.padding,
      this.icon,
      this.prefixIcon,
      this.textStyle,
      });

  final double? height;
  final double? width;
  final double? radius;
  final String? text;
  final Color? color;
  final Color? txtColor;
  final FontWeight? txtWeight;
  final double? txtFontSize;
  final Color? borderColor;
  final Widget? icon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool loading;
  final double? loadingSize;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      // borderRadius: BorderRadius.circular(radius ?? 35.r),
      child: Container(
        width: width ,
        height: height ?? 48.h,
        margin: padding,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: loading
              ? Colors.grey[300]
              : color ?? Styles.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(radius ?? 100.r),
          gradient: gradient,
          border: Border.all(
            width: 0.5,
            color: loading ? Colors.grey[300]! : borderColor ?? Colors.transparent,
          ),
        ),
        child: loading
            ? Center(
              child: SizedBox(
                  height: loadingSize,
                  width: loadingSize,
                  child: CircularProgressIndicator(
                    color: color ?? Styles.PRIMARY_COLOR,
                  ),
              ),
            )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  if (prefixIcon != null) const SizedBox(width: 8),
                  Text(
                    text ?? "Click here",
                    style: textStyle ?? AppTextStyles.w700.copyWith(
                      fontSize: txtFontSize ?? 16,
                      color: txtColor ?? Colors.white,
                      fontWeight: txtWeight,
                    ),
                  ),
                  if (icon != null) const SizedBox(width: 8),
                  if (icon != null) icon!,
                ],
              ),
      ),
    );
  }
}
