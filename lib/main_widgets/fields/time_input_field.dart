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

class TimeInputField extends StatefulWidget {
  const TimeInputField({
    super.key,
    this.onChange,
    this.errorText,
    this.hintText,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
    this.initialValue, this.suffixIcon, this.color, this.borderColor, this.padding, this.prefixIcon, this.height, this.errorStyle, this.isIntervals,
  });
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final double? height;
  final bool hasError;
  final Function(DateTime value)? onChange;
  final bool withBottomPadding;
  final DateTime? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? errorStyle;
  final bool? isIntervals;

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  DateTime? value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) Text(widget.labelText ?? "",style: AppTextStyles.w700.copyWith(fontSize: 14),),
        if (widget.labelText != null) SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            if(widget.isIntervals == true) {
              showBottomSheetTimeIntervalsPicker(
                onChange: (value) {
                  setState(() {
                    this.value = value;
                    print(value);
                    widget.onChange?.call(value);
                  });
                },
                initialTime: widget.initialValue,
              );
            } else {
              showBottomSheetTimePicker(
                onChange: (value) {
                  setState(() {
                    this.value = value;
                    print(value);
                    widget.onChange?.call(value);
                  });
                },
              );
            }
          },
          child: Container(
            height: widget.height,
            padding: widget.padding ?? EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              color: widget.color,
              border: _mapBorder(borderColor: widget.borderColor ?? (value != null ? Theme.of(context).colorScheme.primary :  Styles.BORDER_COLOR)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                if(widget.prefixIcon != null) Container(
                  height: 24.h,
                  width: 40.w,
                  child: widget.prefixIcon ?? Icon(Icons.keyboard_arrow_down, size: 24.sp, color: Styles.DARK_GREY_COLOR,),
                ),
                if(widget.prefixIcon == null) SizedBox(width: 16.w),

                Expanded(
                  child: Text(
                    value != null ? value!.toFormattedTime() : widget.hintText ?? "",
                    style: AppTextStyles.w300.copyWith(fontSize: 14 ,color: value == null ? Styles.GREY_TEXT_COLOR : null),
                  ),
                ),
                // drawSvgIcon("clock", iconColor: Styles.ICONS_COLOR),
                if(widget.suffixIcon == null) SizedBox(width: 16.w),
                if(widget.suffixIcon != null) Container(
                  height: 24.h,
                  width: 50.w,
                  child: widget.suffixIcon ?? Icon(Icons.access_time_sharp, size: 24.sp, color: Styles.DARK_GREY_COLOR),
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
              Text(widget.errorText ?? "Error", style: widget.errorStyle ?? TextStyle(color: Colors.red)),
            ],
          ),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }

  Border _mapBorder({required Color borderColor}) {
    return Border.all(
      width: 0.5,
      color: borderColor,
    );
  }

//============================================================================== Default Time Picker
  showBottomSheetTimePicker({required Function(DateTime) onChange,}) {
    DateTime time = DateTime.now();
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
                        minimumDate: DateTime(1900),
                        maximumDate: DateTime.now().add(const Duration(days: 1000)),
                        initialDateTime: DateTime.now(),
                        mode: CupertinoDatePickerMode.time,
                        dateOrder: DatePickerDateOrder.ymd,
                        use24hFormat: false,
                        onDateTimeChanged: (value) {
                          time = value;
                          onChange(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: CustomButton(
                      text: tr("confirm"),
                      onTap: () {
                        onChange(time);
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


//============================================================================== Time intervals every 30

  showBottomSheetTimeIntervalsPicker({required Function(DateTime) onChange, DateTime? initialTime}) {
    DateTime now = DateTime.now();
    List<DateTime> timeIntervals = List.generate(48, (index) {
      return DateTime(now.year, now.month, now.day).add(Duration(minutes: 30 * index));
    });
    DateTime? selectedTime;
    int? initialIndex;

    if(initialTime != null) {
      for(int i = 0; i < timeIntervals.length; i++) {
        if(initialTime == timeIntervals[i]) {
          initialIndex = i;
          selectedTime = timeIntervals[i];
        }
      }
    } else {
      selectedTime = timeIntervals[0];
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      context: CustomNavigator.navigatorState.currentContext!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              height: orientation == Orientation.landscape ? MediaQueryHelper.height : MediaQueryHelper.height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40, // Height of each item
                      diameterRatio: 1.5,
                      useMagnifier: true,
                      magnification: 1,
                      scrollController: FixedExtentScrollController(initialItem: initialIndex ?? 0),
                      onSelectedItemChanged: (index) {
                        selectedTime = timeIntervals[index];
                      },
                      children: timeIntervals.map((time) {
                        String formattedTime = DateFormat('hh:mm a').format(time);
                        return Center(
                          child: Text(
                            formattedTime,
                            style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  CustomButton(
                    text: tr("confirm"),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    onTap: () {
                      onChange(selectedTime!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}