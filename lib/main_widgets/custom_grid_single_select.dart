import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';

class CustomGridSingleSelect extends StatefulWidget {
  final String? label;
  final List<SelectOption> values;
  final SelectOption? initialValue;
  final EdgeInsetsGeometry? padding;
  final void Function(SelectOption? value)? onChange;
  final bool? isTranslated;
  const CustomGridSingleSelect({super.key, this.label, required this.values, this.initialValue, this.padding, this.onChange, this.isTranslated});

  @override
  State<CustomGridSingleSelect> createState() => _CustomGridSingleSelectState();
}

class _CustomGridSingleSelectState extends State<CustomGridSingleSelect> {
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
          Text(widget.label ?? "", style: AppTextStyles.w700.copyWith(fontSize: 14)),
          SizedBox(height: 16.h),
          GridView.builder(
            itemCount: widget.values.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 0,
              childAspectRatio: 3.5.w,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    selectValue = widget.values[index];
                    setState(() {});
                    widget.onChange!(selectValue);
                  },
                  child: _SelectOptionCard(
                    isSelected: selectValue !=null ? (selectValue!.value == widget.values[index].value) : false,
                    option: widget.values[index],
                    isTranslated: widget.isTranslated,
                  )
              );
            },
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
    this.isTranslated = false,
  });

  final bool isSelected;
  final bool? isTranslated;
  final SelectOption option;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.width,
      margin: EdgeInsets.symmetric(vertical: 14.h),
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
            child: Text(isTranslated == true ? tr(option.label) : option.label, style: AppTextStyles.w400.copyWith(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}