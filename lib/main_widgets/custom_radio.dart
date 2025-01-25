import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';

class CustomRadio extends StatefulWidget {
  final int? value;
  final int? groupValue;
  final void Function(int?)? onChanged;
  final Color? activeColor;
  final Color? nonActiveColor;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged, this.activeColor, this.nonActiveColor})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.value == widget.groupValue;

    return InkWell(
      onTap: () => widget.onChanged!(widget.value),
      splashColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.grey[200],
          border: Border.all(color: selected ? widget.activeColor ?? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR)
        ),
        child: Icon(
          Icons.circle,
          size: 16,
          color: selected ? widget.activeColor ?? Styles.PRIMARY_COLOR : widget.nonActiveColor ?? Colors.transparent,
        ),
      ),
    );
  }
}