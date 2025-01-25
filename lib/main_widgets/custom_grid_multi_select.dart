import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/check_box_view.dart';

class CustomGridMultiSelect extends StatefulWidget {
  final String? label;
  final Function(List<SelectOption> option) onSelect;
  final List<SelectOption> values;
  final List<SelectOption>? selectValue;
  final EdgeInsetsGeometry? padding;
  final double? labelHeight;
  final double? fontSize;
  const CustomGridMultiSelect({super.key, this.label, this.padding, required this.onSelect, required this.values, this.selectValue, this.labelHeight, this.fontSize});

  @override
  State<CustomGridMultiSelect> createState() => _CustomGridMultiSelectState();
}

class _CustomGridMultiSelectState extends State<CustomGridMultiSelect> {
  List<SelectOption> selectedList = [];
  bool showMore = false;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    selectedList = widget.selectValue ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label ?? "", style: AppTextStyles.w600.copyWith(fontSize: 14)),
          SizedBox(height: widget.labelHeight ?? 14.h),

          GridView.builder(
            itemCount: widget.values.length > 6 && showMore == false ? 6 : widget.values.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 0,
              childAspectRatio: 3.5.w,
            ),
            itemBuilder: (context, index) {
              if (widget.selectValue != null) {
                isSelected = widget.selectValue!.any(
                        (element) => element.value == widget.values[index].value);
              }
              return ListTile(
                splashColor: Colors.transparent,
                onTap: () {
                  if (selectedList.any((element) =>
                  element.value == widget.values[index].value)) {
                    selectedList.removeWhere((element) =>
                    element.value == widget.values[index].value);
                  } else {
                    selectedList.add(widget.values[index]);
                  }
                  widget.onSelect(widget.values);
                  setState(() {});
                },
                minLeadingWidth: 0,
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: CheckBoxView(isChecked: isSelected),
                title: Text(
                  widget.values[index].label,
                  style: AppTextStyles.w400.copyWith(fontSize: widget.fontSize ?? 11),
                ),
              );
            },
          ),

          if(widget.values.length > 6 )...[
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                setState(() {
                  showMore = !showMore;
                });
              },
              child: Text(
                showMore == false ? tr("showMore") : tr("showLess"),
                style: AppTextStyles.w500.copyWith(
                  fontSize: 12,
                  color: Styles.PRIMARY_COLOR,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}