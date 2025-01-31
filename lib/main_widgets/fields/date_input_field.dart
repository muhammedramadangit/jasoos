import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/utiltiy/date_formatter.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    this.onChange,
    this.errorText,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.withBottomPadding = true,
    this.hasError = false,
    this.initialValue,
    this.minDate,
    this.maxDate,
    this.prefixIcon,
    this.suffixIcon, this.color, this.borderColor, this.padding,
  });
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final Function(DateTime)? onChange;
  final bool withBottomPadding;
  final DateTime? initialValue;
  final DateTime? minDate;
  final DateTime? maxDate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  DateTime? date;

  @override
  void initState() {
    super.initState();
    date = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) Text(widget.labelText ?? "",style: widget.labelStyle ?? AppTextStyles.w700.copyWith(fontSize: 12),),
        if (widget.labelText != null) const SizedBox(height: 8),
        GestureDetector(
          onTap: () => showBottomSheetDatePicker(
            onChange: (value) {
              setState(() {
                date = value;
                widget.onChange?.call(value);
              });
            },
            initValue: widget.initialValue,
            minDate: widget.minDate,
            maxDate: widget.maxDate,
          ),
          child: Container(
            height: 56,
            margin: widget.padding ?? EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: widget.color,
              border: _mapBorder(borderColor: date != null ? Theme.of(context).colorScheme.primary : widget.borderColor ?? Styles.BORDER_COLOR),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              children: [
                if(widget.prefixIcon != null) Container(
                  height: 24.h,
                  width: 50.w,
                  child: widget.prefixIcon ?? Icon(Icons.keyboard_arrow_down, size: 24, color: Styles.DARK_GREY_COLOR,),
                ),
                if(widget.prefixIcon == null) SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    date != null ? date!.toYearMonthDayFormat() : widget.hintText ?? "",
                    style: AppTextStyles.w400.copyWith(fontSize: 14, color: Styles.GREY_COLOR),
                  ),
                ),

                if(widget.suffixIcon == null) SizedBox(width: 16.w),
                if(widget.suffixIcon != null) Container(
                  height: 24.h,
                  width: 50.w,
                  child: widget.suffixIcon ?? Icon(Icons.date_range, size: 24.sp, color: Styles.DARK_GREY_COLOR),
                ),
              ],
            ),
          ),
        ),
        if (widget.hasError) const SizedBox(height: 8),
        if (widget.hasError)
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Text(widget.errorText ?? "Error", style: const TextStyle(color: Colors.red)),
            ],
          ),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }

  Border _mapBorder({required Color borderColor}) {
    return Border.all(
      width: 1,
      color: borderColor,
    );
  }
}

//===============================================================

showBottomSheetDatePicker({required Function(DateTime) onChange, VoidCallback? onPick, DateTime? initValue, DateTime? minDate, DateTime? maxDate}) {
  DateTime date = initValue ?? DateTime.now();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: CustomNavigator.navigatorState.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          height: orientation == Orientation.landscape ? MediaQueryHelper.height : MediaQueryHelper.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary),
                    ),
                    child: Center(
                      child: Icon(Icons.close, color: Theme.of(context).colorScheme.primary, size: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: CupertinoDatePicker(
                    minimumDate: minDate ?? DateTime(1900),
                    maximumDate: maxDate,
                    initialDateTime: initValue ?? DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.ymd,
                    onDateTimeChanged: (value) {
                      date = value;
                      onChange(value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomButton(
                  text: tr("confirm"),
                  onTap: onPick ?? () {
                    onChange(date);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      }
    ),
  );
}