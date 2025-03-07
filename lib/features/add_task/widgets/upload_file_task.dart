import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../../../helper/constants.dart';
import '../../../helper/file_picker_helper.dart';
import '../../../helper/styles.dart';
import '../bloc/start_task_bloc.dart';
import '../models/questions_model.dart';
import 'custom_task_card.dart';

class UploadFileTask extends StatelessWidget {
  final QuestionInfo? model;
  const UploadFileTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return CustomTaskCard(
      isDotted: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload a file",
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
            ],
          ),
          24.verticalSpace,
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
            onTap: () {
              FilePickerHelper.pickFile(
                type: FileType.media,
                multiImages: false,
                isSingleFile: true,
              ).then((value) {
                StartTaskBloc.instance.videoAnswer = value;
              });
            },
            text: "Add file",
            prefixIcon: SvgPicture.asset(Constants.getSvg("upload")),
          ),
        ],
      ),
    );
  }
}
