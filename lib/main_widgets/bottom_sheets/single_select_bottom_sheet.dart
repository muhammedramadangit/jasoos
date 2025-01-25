import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_empty_view.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';
import 'package:jasoos/main_widgets/select_option_view.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class SingleSelectBottomSheet extends StatefulWidget {
  const SingleSelectBottomSheet({
    Key? key,
    required this.onSelect,
    required this.valueSet,
    this.selecetedValue, this.hasSearch,
  }) : super(key: key);
  final Function(SelectOption option) onSelect;
  final List<SelectOption> valueSet;
  final SelectOption? selecetedValue;
  final bool? hasSearch;

  @override
  State<SingleSelectBottomSheet> createState() => _SingleSelectBottomSheetState();
}

class _SingleSelectBottomSheetState extends State<SingleSelectBottomSheet> {
  SelectOption? selecetValue;
  List<SelectOption>? values;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selecetValue = widget.selecetedValue;
    if(widget.valueSet.isEmpty) {
      values = [];
    } else {
      values = [...widget.valueSet];
    }
  }

  search(String? value) {
    if(value != null) {
      values = [
        ...widget.valueSet.where((element) {
          return element.label.toLowerCase().contains(value.toLowerCase().trim());
        }),
      ];
    } else {
      values = [...widget.valueSet];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 480,
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "chooseFromList".tr(),
                    style: AppTextStyles.w700.copyWith(fontSize: 16, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () => CustomNavigator.pop(),
                    child: Icon(
                      Icons.close,
                      color: Color(0xff8B97A3),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(24), child: Divider(height: 1, color: Colors.grey)),
            if(widget.hasSearch == true)
              TextInputField(
                suffixIcon: InkWell(
                  onTap: () {
                    searchController.clear();
                    search(null);
                    setState(() {});
                  },
                  child: Icon(Icons.close, color: Styles.GREY_TEXT_COLOR,),
                ),
                prefixIcon: SvgPicture.asset(Constants.getSvg("search"), height: 24.w, width: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 24),
                hintText: tr("search"),
                keyboardType: TextInputType.text,
                controller: searchController,
                onChange: (value) {
                  search(value);
                },
              ),
            Expanded(
              child: values!.isEmpty ? CustomEmptyView() : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      ...List.generate(
                        values!.length,
                            (index) => GestureDetector(
                            onTap: () {
                              selecetValue = values![index];
                              setState(() {

                              });
                            },
                            child: SelectOptionView(
                              isSelected: selecetValue!=null? (selecetValue!.value == values![index].value):false,
                              option: values![index],
                            )
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:24,vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: tr("confirm"),
                      onTap: () {
                        widget.onSelect(selecetValue!);
                        CustomNavigator.pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
