import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import 'custom_task_card.dart';

class UploadReceiptTask extends StatelessWidget {
  const UploadReceiptTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTaskCard(
          isDotted: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: Styles.HIGHLIGHT_COLOR,
                child: Center(
                  child: SvgPicture.asset(Constants.getSvg("document-upload")),
                ),
              ),
              16.verticalSpace,
              Text(
                "Upload your Receipt",
                style: AppTextStyles.w500.copyWith(
                  color: Styles.WHITE_COLOR,
                  fontSize: 16,
                ),
              ),
              8.verticalSpace,
              Text(
                "Max. file size 10 MB",
                style: AppTextStyles.w400.copyWith(
                  color: Styles.WHITE_COLOR,
                  fontSize: 12,
                ),
              ),
              24.verticalSpace,
              CustomButton(
                text: "Add file",
                prefixIcon: SvgPicture.asset(Constants.getSvg("upload")),
              ),
            ],
          ),
        ),

        TextInputField(
          labelText: "Note",
          hintText: "Tell us about your ideal customer's needs and desires.",
          labelStyle: AppTextStyles.w500.copyWith(
            fontSize: 12,
            color: Styles.WHITE_COLOR,
          ),
          radius: 12.r,
          color: Styles.BACKGROUND_COLOR,
          borderColor: Styles.BACKGROUND_COLOR,
          maxLines: 4,
          style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.WHITE_COLOR),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
      ],
    );
  }
}
