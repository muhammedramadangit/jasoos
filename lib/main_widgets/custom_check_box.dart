import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';

class CustomCheckBox extends StatefulWidget {
  final bool? isSelected;
  final Color? fillColor;
  final Color? selectedColor;
  final double? radius;
  final double? size;
  final void Function(bool?) onChanged;

  const CustomCheckBox({Key? key, this.isSelected, required this.onChanged, this.fillColor, this.selectedColor, this.radius, this.size})
      : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isChecked;

  @override
  void initState() {
    isChecked = widget.isSelected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked!;
        });
        widget.onChanged(isChecked);
      },
      splashColor: Colors.transparent,
      child: Container(
        height: widget.size ?? 22,
        width: widget.size ?? 22,
        decoration: BoxDecoration(
          color: isChecked == true
              ? widget.selectedColor ?? Theme.of(context).primaryColor
              : widget.fillColor ?? Colors.transparent,
          border: Border.all(
              color: isChecked == true
                  ? widget.selectedColor ?? Theme.of(context).primaryColor
                  : Styles.BORDER_COLOR,
              width: 1),
          borderRadius: BorderRadius.circular(widget.radius ?? 5.r),
        ),
        child: Center(
          child: isChecked == true
              ? Icon(
                  CupertinoIcons.checkmark_alt,
                  color: Styles.WHITE_COLOR,
                  size: 18,
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
