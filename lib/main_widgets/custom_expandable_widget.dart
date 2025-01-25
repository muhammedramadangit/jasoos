import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomExpandableWidget extends StatefulWidget {
  final String? title;
  final Widget? child;
  final bool? isExpanded;
  const CustomExpandableWidget({super.key, this.title, this.child, this.isExpanded});

  @override
  State<CustomExpandableWidget> createState() => _CustomExpandableWidgetState();
}

class _CustomExpandableWidgetState extends State<CustomExpandableWidget> {
  bool? isOpened;

  @override
  void initState() {
    isOpened = widget.isExpanded ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
        color: Styles.WHITE_COLOR,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isOpened = !isOpened!;
              });
            },
            splashColor: Colors.transparent,
            child: Row(
              children: [
                Text(
                  widget.title ?? "",
                  style: AppTextStyles.w600.copyWith(
                    fontSize: 16,
                    color: Styles.PRIMARY_COLOR,
                  ),
                ),
                Spacer(),
                SizedBox(width: 16),
                Icon(isOpened == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Styles.PRIMARY_COLOR)
              ],
            ),
          ),
          if(isOpened == true)...[
            SizedBox(height: 16.h),
            SizedBox(width: 1.sh, child: widget.child ?? SizedBox()),
          ],
        ],
      ),
    );
  }
}
