import 'package:flutter/material.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';

class SelectOptionView extends StatelessWidget {
  const SelectOptionView({
    super.key,
    required this.isSelected,
    required this.option,
  });

  final bool isSelected;
  final SelectOption option;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQueryHelper.height,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isSelected != true
            ? Colors.white
            : Styles.PRIMARY_COLOR.withOpacity(0.08),

        borderRadius: BorderRadius.circular(12),
        border: isSelected != true
            ? Border.all(color: Color(0xffF3EDF7), width: 1)
            : Border.all(
          color: Color(0xffF3EDF7),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(option.label, style: AppTextStyles.w500.copyWith(fontSize: 16))),
          Container(
            width: 18,
            height: 18,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                  color: isSelected != true
                      ? Color(0xffE7E7E7)
                      : Styles.PRIMARY_COLOR
              ),
            ),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected!=true
                      ? Colors.white
                      : Styles.PRIMARY_COLOR
              ),
            ),
          )
        ],
      ),
    );
  }
}