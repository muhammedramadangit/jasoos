import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';

class CustomListedSingleSelect extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final List<SelectOption> values;
  final SelectOption? initialValue;
  final EdgeInsetsGeometry? padding;
  final Function(SelectOption)? onChange;
  final EdgeInsets? itemsPadding;
  const CustomListedSingleSelect({super.key, this.label, required this.values, this.initialValue, this.padding, this.onChange, this.labelStyle, this.itemsPadding});

  @override
  State<CustomListedSingleSelect> createState() => _CustomListedSingleSelectState();
}

class _CustomListedSingleSelectState extends State<CustomListedSingleSelect> {
  SelectOption? selectValue;

  @override
  void initState() {
    super.initState();
    selectValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label ?? "", style: widget.labelStyle ?? AppTextStyles.w700.copyWith(fontSize: 14)),
          SizedBox(height: 8.h),
          ...List.generate(
            widget.values.length,
                (index) => GestureDetector(
                onTap: () {
                  selectValue = widget.values[index];
                  widget.onChange?.call(selectValue!);
                  setState(() {});
                },
                child: _SelectOptionCard(
                  isSelected: selectValue !=null ? (selectValue!.value == widget.values[index].value) : false,
                  option: widget.values[index],
                  padding: widget.itemsPadding,
                )
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectOptionCard extends StatelessWidget {
  const _SelectOptionCard({
    required this.isSelected,
    required this.option,
    this.padding,
  });

  final bool isSelected;
  final SelectOption option;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.width,
      margin: padding ?? EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Container(
            width: 20.h,
            height: 20.h,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: isSelected != true
                    ? Color(0xffE7E7E7)
                    : Styles.PRIMARY_COLOR,
              ),
            ),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected != true ? Colors.white : Styles.PRIMARY_COLOR,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(option.label, style: AppTextStyles.w500.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}