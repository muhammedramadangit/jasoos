import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/bottom_sheets/single_select_bottom_sheet.dart';

class SingleSelectInputField extends StatefulWidget {
  const SingleSelectInputField({
    super.key,
    this.onChange,
    this.errorText,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.withBottomPadding = true,
    this.hasError = false,
    this.hasSearch = false,
    this.initialValue,
    required this.valueSet,
    this.isExpanded,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.height,
    this.radius,
    this.suffixIcon,
    this.prefixIcon,
    this.showDropIcon = true,
    this.labelHintText,
  });

  final String? hintText;
  final String? labelText;
  final String? labelHintText;
  final String? errorText;
  final bool hasError;
  final bool hasSearch;
  final bool? isExpanded;
  final bool? showDropIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final double? radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(SelectOption)? onChange;
  final bool withBottomPadding;
  final List<SelectOption> valueSet;
  final SelectOption? initialValue;
  final TextStyle? labelStyle;

  @override
  State<SingleSelectInputField> createState() => _SingleSelectInputFieldState();
}

class _SingleSelectInputFieldState extends State<SingleSelectInputField> {
  SelectOption? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Row(
            children: [
              Text(
                widget.labelText ?? "",
                style: widget.labelStyle ?? AppTextStyles.w700.copyWith(fontSize: 12),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.labelHintText ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.w500.copyWith(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        if (widget.labelText != null) const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              builder: (context) => SingleSelectBottomSheet(
                valueSet: widget.valueSet,
                selecetedValue: value,
                hasSearch: widget.hasSearch,
                onSelect: (option) {
                  setState(() {
                    value = option;
                  });
                  widget.onChange?.call(option);
                },
              ),
            );
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: widget.height,
            margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.radius ?? 100.r),
              border: Border.all(color: widget.borderColor ?? Styles.BORDER_COLOR),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  Container(
                    height: 24.h,
                    width: 50.w,
                    child: widget.prefixIcon ?? SizedBox(),
                  ),
                ],
                if (widget.prefixIcon == null) SizedBox(width: 16.w),
                widget.isExpanded == true
                    ? Expanded(
                        child: Padding(
                          padding: widget.padding ?? EdgeInsets.symmetric(vertical: 16.h),
                          child: Text(
                            value != null
                                ? value!.label
                                : widget.hintText ?? "",
                            style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.GREY_COLOR),
                          ),
                        ),
                      )
                    : Padding(
                        padding: widget.padding ?? EdgeInsets.symmetric(vertical: 16.h),
                        child: Text(
                          value != null ? value!.label : widget.hintText ?? "",
                          style: AppTextStyles.w400.copyWith(fontSize: 14, color: Styles.GREY_COLOR),
                        ),
                      ),
                if (widget.showDropIcon == true)
                  Container(
                    height: 24.h,
                    width: 50.w,
                    child: widget.suffixIcon ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Styles.DARK_GREY_COLOR,
                        ),
                  ),
              ],
            ),
          ),
        ),
        if (widget.hasError) SizedBox(height: 8.h),
        if (widget.hasError)
          Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 16),
              SizedBox(width: 4),
              Text(widget.errorText ?? "Error", style: TextStyle(color: Colors.red)),
            ],
          ),
        if (widget.withBottomPadding) SizedBox(height: 16.h),
      ],
    );
  }
}
