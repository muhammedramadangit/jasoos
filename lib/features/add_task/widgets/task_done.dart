import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class TaskDone extends StatelessWidget {
  const TaskDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (MediaQueryHelper.height / 4).verticalSpace,
        Image.asset(Constants.getAsset("clamp")),
        10.verticalSpace,
        Text(
          "Well done we are almost there",
          style: AppTextStyles.w700.copyWith(
            fontSize: 20,
            color: Styles.WHITE_COLOR,
          ),
        ),
        6.verticalSpace,
        Text(
          "Let’s continue and finish this task",
          style: AppTextStyles.w400.copyWith(
            fontSize: 16,
            color: Styles.WHITE_COLOR,
          ),
        ),
      ],
    );
  }
}
