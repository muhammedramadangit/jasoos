import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomTitledQuantity extends StatefulWidget {
  final String? label;
  final String? hint;
  late int? quantity;
  final int? minQuantity;
  final bool? canIncrease;
  final void Function(int) onChange;
   CustomTitledQuantity({this.label, this.hint, required this.onChange, this.minQuantity, required this.quantity, this.canIncrease});

  @override
  State<CustomTitledQuantity> createState() => CustomTitledQuantityState();
}

class CustomTitledQuantityState extends State<CustomTitledQuantity> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
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

          GestureDetector(
            onTap: () {
              if(widget.canIncrease == true) {
                widget.quantity = widget.quantity! + 1;
                setState(() {});
                widget.onChange(widget.quantity!);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: widget.canIncrease == false
                      ? Styles.BORDER_COLOR
                      : Styles.PRIMARY_COLOR,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: widget.canIncrease == false
                      ? Styles.BORDER_COLOR
                      : Styles.PRIMARY_COLOR,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              "${widget.quantity}",
              style: AppTextStyles.w400.copyWith(fontSize: 16),
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {});
              if(widget.minQuantity != null) {
                if(widget.quantity != widget.minQuantity) {
                  widget.quantity = widget.quantity! -1;
                  widget.onChange(widget.quantity!);
                } else {
                }
              } else {
                if(widget.quantity != 0) {
                  widget.quantity = widget.quantity! -1;
                  widget.onChange(widget.quantity!);
                } else {
                  widget.quantity = 1;
                }
              }
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: (widget.minQuantity != null && widget.quantity == widget.minQuantity) || widget.quantity == 0
                      ? Styles.BORDER_COLOR
                      : Styles.PRIMARY_COLOR,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  color: (widget.minQuantity != null && widget.quantity == widget.minQuantity) || widget.quantity == 0
                      ? Styles.BORDER_COLOR
                      : Styles.PRIMARY_COLOR,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
