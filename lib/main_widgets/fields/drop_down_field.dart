import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class DropDownTextField extends StatefulWidget {
  final List<dynamic>? items;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? icon;
  final Function()? onTap;
  final bool isModel;
  final double? paddingHor;
  final double? paddingVer;
  final Color? fillColor;
  final Widget? hintWidget;
  DropDownTextField({required this.hint, required this.items, this.onChanged, this.onTap, this.isModel = false, this.icon, this.paddingHor, this.paddingVer, this.fillColor, this.hintWidget});

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  int? value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
        margin: EdgeInsets.symmetric(vertical: widget.paddingVer ?? 0, horizontal: widget.paddingHor ?? 0),
        decoration: BoxDecoration(
          color: widget.fillColor ?? Colors.transparent,
          border: Border.all(
            color: value != null ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: DropdownButton<int>(
          value: value,
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w), /// to handle dropDownItem padding 15.w
            child: widget.icon != null
                ? Row(
              children: [
                Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFF848484), size: 18.sp),
                SizedBox(width: 5.w),
                Image.asset(Constants.getAsset("${widget.icon}"), height: 18.h, width: 18.w, color: Color(0xFF848484))
              ],
            )
                : Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFF848484), size: 18.sp),
          ),
          borderRadius: BorderRadius.circular(12.r),
          dropdownColor: widget.fillColor ?? Styles.SCAFFOLD_COLOR,
          iconEnabledColor: Color(0xFF848484),
          isExpanded: true,
          underline: const SizedBox(height: 0),
          hint: widget.hintWidget ?? Text(
            widget.hint,
            style: AppTextStyles.w400.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Styles.GREY_COLOR,
            ),
          ),
          items: widget.items!.map((e)=>
              DropdownMenuItem<int>(
                onTap: () {
                  setState(() {
                    value = e.id;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    e.title,
                    style: AppTextStyles.w400.copyWith(fontSize: 14),
                  ),
                ),
                value: e.id,
              )
          ).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

class DropDownModel{
  int? id;
  String? title;

  DropDownModel({this.id, this.title});
}