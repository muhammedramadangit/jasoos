import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../models/questions_model.dart';

class TextTask extends StatelessWidget {
  final QuestionInfo? model;
  const TextTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 550.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQueryHelper.width,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xff282928).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Write your answer",
                  style: AppTextStyles.w700.copyWith(
                    fontSize: 14,
                    color: Styles.WHITE_COLOR,
                  ),
                ),
                16.verticalSpace,
                SvgPicture.asset(Constants.getSvg("rocket"), height: 40, width: 40),
                12.verticalSpace,
                Text(
                  model?.question ?? "",
                  style: AppTextStyles.w700.copyWith(
                    fontSize: 24,
                    color: Styles.WHITE_COLOR,
                  ),
                ),
                24.verticalSpace,
                TextInputField(
                  labelText: "Note",
                  hintText: "Tell us about your ideal customer's needs and desires.",
                  controller: StartTaskBloc.instance.textAnswer,
                  labelStyle: AppTextStyles.w500.copyWith(
                    fontSize: 12,
                    color: Styles.WHITE_COLOR,
                  ),
                  radius: 12.r,
                  color: Styles.BACKGROUND_COLOR,
                  borderColor: Styles.BACKGROUND_COLOR,
                  maxLines: 4,
                  style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.WHITE_COLOR),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
