import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class IdInformationForm extends StatelessWidget {
  const IdInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputField(
          labelText: "ID Number",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: "86988098806"),
        ),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Styles.BORDER_COLOR),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(Constants.getSvg("pdf"), height: 40, width: 40),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID",
                      style: AppTextStyles.w500.copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "CV.pdf 300KB",
                      style: AppTextStyles.w400.copyWith(
                        fontSize: 12,
                        color: Styles.GREY_TEXT_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                Constants.getSvg("edit"),
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
              ),
              SizedBox(width: 8.w),
              Icon(CupertinoIcons.clear_circled, color: Styles.RED_COLOR),
            ],
          ),
        ),
      ],
    );
  }
}
