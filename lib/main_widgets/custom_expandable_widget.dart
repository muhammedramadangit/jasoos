import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';

class CustomExpandableWidget extends StatefulWidget {
  final Widget? title;
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
                widget.title ?? SizedBox(),
                Spacer(),
                SizedBox(width: 16),
                SvgPicture.asset(Constants.getSvg(isOpened == true ? "arrow-up" : "arrow-ios-down"),),
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
