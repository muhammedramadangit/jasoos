import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomTitledSwitch extends StatefulWidget {
  final String? label;
  final String? hint;
  final bool? isActive;
  final void Function(bool)? onChange;
  const CustomTitledSwitch({super.key, this.label, this.hint, this.isActive, this.onChange});

  @override
  State<CustomTitledSwitch> createState() => _CustomTitledSwitchState();
}

class _CustomTitledSwitchState extends State<CustomTitledSwitch> {
  bool? isActive;

  @override
  void initState() {
    isActive = widget.isActive ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label ?? "",
                  style: AppTextStyles.w500.copyWith(fontSize: 14),
                ),
                if(widget.hint != null)...[
                  SizedBox(height: 8.h),
                  Text(
                    widget.hint ?? "",
                    style: AppTextStyles.w400.copyWith(fontSize: 11, color: Styles.GREY_TEXT_COLOR),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: 8.w),
          CupertinoSwitch(
            value: isActive!,
            activeColor: Styles.PRIMARY_COLOR,
            onChanged: (value) {
              setState(() => isActive = !isActive!);
              widget.onChange;
            },
          ),
        ],
      ),
    );
  }
}
