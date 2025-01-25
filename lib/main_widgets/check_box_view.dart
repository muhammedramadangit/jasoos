import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';

class CheckBoxView extends StatelessWidget {
  const CheckBoxView({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: isChecked ? Styles.PRIMARY_COLOR : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: isChecked ? Colors.transparent : Color(0xffE7E7E7),
        ),
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.checkmark_alt,
          size: 16,
          color: isChecked ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
