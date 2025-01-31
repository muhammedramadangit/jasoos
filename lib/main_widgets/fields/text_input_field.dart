import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:country_code_picker/country_code_picker.dart';

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
    this.onChangedCountryCode,
    this.initialSelectionCountryCode, this.labelStyle,
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
  final TextStyle? labelStyle;
  final void Function(CountryCode)? onChangedCountryCode;
  final String? initialSelectionCountryCode;
  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showText = true;
  String? value;

  _mapSuffixIcon() {
    if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        child: SvgPicture.asset(
          showText
              ? Constants.getSvg("eye_hide")
              : Constants.getSvg("eye_show"),
          colorFilter: ColorFilter.mode(Styles.GREY_COLOR, BlendMode.srcIn),
        ),
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

  _mapPrefixIcon() {
    if (widget.keyboardType == TextInputType.phone) {
      return Container(
        child: CountryCodePicker(
          padding: EdgeInsets.zero,
          onChanged: widget.onChangedCountryCode,
          initialSelection: widget.initialSelectionCountryCode ?? '+966',
          showFlagDialog: true,
          flagDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          hideMainText: true,
          builder: (p0) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 26.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(
                        "${p0?.flagUri}",
                        package: 'country_code_picker',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                SvgPicture.asset(Constants.getSvg("arrow-down")),
                SizedBox(width: 10),
                Container(
                  height: 24,
                  width: 1,
                  color: Styles.BORDER_COLOR,
                ),
              ],
            );
          },
        ),
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
              style: widget.labelStyle ?? AppTextStyles.w700.copyWith(fontSize: 12),
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
                style: AppTextStyles.w500.copyWith(fontSize: 14),
                obscureText: !showText,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines ?? 1,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  errorStyle: AppTextStyles.w300.copyWith(fontSize: 10, color: Colors.red),
                  errorMaxLines: 2,
                  hintStyle: AppTextStyles.w400.copyWith(fontSize: 14, color: Styles.GREY_COLOR),
                  contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w ,vertical: 16.h),
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12, end: 16),
                    child: widget.suffixIcon ?? _mapSuffixIcon(),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 16, end: 12),
                    child: widget.prefixIcon ?? _mapPrefixIcon(),
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: widget.suffixMaxHeight ?? 24.h, maxWidth: widget.suffixMaxWidth ?? 100.w),
                  prefixIconConstraints: BoxConstraints(maxHeight: widget.prefixHeight ?? 24.h, maxWidth: widget.prefixWidth ?? 100.w),
                  enabledBorder: _mapBorder(borderColor: widget.hasError ? Styles.RED_COLOR : (value != null ? Styles.PRIMARY_COLOR : widget.borderColor ?? Styles.BORDER_COLOR)),
                  focusedBorder: _mapBorder(borderColor: widget.hasError ? Styles.RED_COLOR : (widget.borderColor ?? Theme.of(context).colorScheme.primary)),
                  errorBorder: _mapBorder(borderColor: Styles.RED_COLOR),
                  border: _mapBorder(borderColor: Colors.transparent),
                  fillColor: widget.color,
                  filled: true,
                ),
              ),
            ),
          ),
          if (widget.hasError) SizedBox(height: 6),
          if (widget.hasError)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                widget.errorText ?? "Error",
                style: widget.errorStyle ?? AppTextStyles.w400.copyWith(color: Styles.RED_COLOR, fontSize: 12),
              ),
            ),
          if (widget.withBottomPadding) SizedBox(height: 16.h),
        ],
      ),
    );
  }

  OutlineInputBorder _mapBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius ?? 100.r),
      borderSide: BorderSide(color: borderColor),
    );
  }
}