import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    this.onChange,
    this.controller,
    this.inputFormatters = const [],
    this.errorText,
    this.hintText,
    this.initialValue,
    this.labelText,
    this.withBottomPadding = true,
    this.readOnly = false,
    this.hasError = false,
    this.keyboardType,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.prefixIcon,
    this.onTap,
    this.suffixMaxWidth,
    this.height,
    this.radius,
    this.contentPadding,
    this.padding,
    this.prefixWidth,
    this.color,
    this.borderColor,
    this.enableInteractiveSelection,
    this.width,
    this.autofocus,
    this.suffixMaxHeight,
    this.prefixHeight,
    this.validator,
    this.autoValidateMode,
    this.errorStyle,
    this.textCapitalization = TextCapitalization.none,
  });

  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final bool withBottomPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool? readOnly;
  final double? suffixMaxWidth;
  final double? suffixMaxHeight;
  final double? prefixWidth;
  final double? prefixHeight;
  final double? height;
  final double? radius;
  final double? width;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final List<TextInputFormatter> inputFormatters;
  final Color? color;
  final Color? borderColor;
  final bool? enableInteractiveSelection;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization textCapitalization;
  final TextStyle? errorStyle;
  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showText = true;
  String? value;
  _mapSuffixIcon() {
    if (widget.keyboardType == null) {
      return null;
    } else if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        child: SvgPicture.asset(showText ? Constants.getSvg("eye_hide") : Constants.getSvg("eye_show"), color: Styles.GREY_TEXT_COLOR),
        onTap: () {
          setState(() {
            showText = !showText;
          });
        },
      );
    } else {
      return null;
    }
  }
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    showText = widget.keyboardType != TextInputType.visiblePassword;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText ?? "",
              style: AppTextStyles.w700.copyWith(fontSize: 12),
            ),
          if (widget.labelText != null) const SizedBox(height: 8),
          Container(
            height: widget.height,
            width: widget.width,
            child: Center(
              child: TextFormField(
                // enableInteractiveSelection: widget.keyboardType == TextInputType.visiblePassword || widget.keyboardType == TextInputType.phone ? false : widget.enableInteractiveSelection,
                textCapitalization: widget.textCapitalization,
                readOnly: widget.readOnly!,
                validator: widget.validator,
                autovalidateMode: widget.autoValidateMode,
                autofocus: widget.autofocus ?? false,
                onTap: widget.readOnly == true ? widget.onTap : null,
                controller: widget.controller,
                initialValue: widget.controller != null ? null : widget.initialValue,
                onChanged: (val){
                  setState(() {
                    if(val.isNotEmpty)this.value = val;
                    else this.value = null;
                  });
                  widget.onChange?.call(val);
                },
                keyboardType: widget.keyboardType ?? TextInputType.text,
                style: AppTextStyles.w300.copyWith(fontSize: 14),
                obscureText: !showText,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines ?? 1,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.red),
                  errorMaxLines: 2,

                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Styles.GREY_COLOR),
                  contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w ,vertical: 16.h),
                  suffixIcon: widget.suffixIcon ?? _mapSuffixIcon(),
                  prefixIcon: widget.prefixIcon,
                  suffixIconConstraints: BoxConstraints.expand(height: widget.suffixMaxHeight ?? 24.h, width: widget.suffixMaxWidth ?? 50.w),
                  prefixIconConstraints: BoxConstraints.expand(height: widget.prefixHeight ?? 24.h, width: widget.prefixWidth ?? 50.w),
                  enabledBorder: _mapBorder(borderColor: (value != null ? Styles.PRIMARY_COLOR : widget.borderColor ?? Styles.BORDER_COLOR)),
                  focusedBorder: _mapBorder(borderColor: widget.borderColor ?? Theme.of(context).colorScheme.primary),
                  errorBorder: _mapBorder(borderColor: Colors.red),
                  border: _mapBorder(borderColor: Colors.transparent),
                  fillColor: widget.color,
                  filled: true,
                ),
              ),
            ),
          ),
          if (widget.hasError) const SizedBox(height: 8),
          if (widget.hasError)
            Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Expanded(child: Text(widget.errorText ?? "Error", style: widget.errorStyle ?? TextStyle(color: Colors.red))),
              ],
            ),
          if (widget.withBottomPadding) SizedBox(height: 16.h),
        ],
      ),
    );
  }

  OutlineInputBorder _mapBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
      borderSide: BorderSide(color: borderColor),
    );
  }
}