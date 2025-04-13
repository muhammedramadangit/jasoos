import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/widgets/custom_task_card.dart';
import 'package:jasoos/features/add_task/widgets/upload_bottom_sheet.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/start_task_bloc.dart';
import '../models/questions_model.dart';

class UploadVideoTask extends StatelessWidget {
  final QuestionInfo? model;

  const UploadVideoTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return CustomTaskCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr("uploadVideo"),
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
          BlocBuilder<StartTaskBloc, AppState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  showUploadImageBottomSheet(isImage: false);
                },
                child: Container(
                  height: 114.h,
                  width: MediaQueryHelper.width,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Styles.BLUE_COLOR,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Constants.getSvg("video"),
                          colorFilter: ColorFilter.mode(
                              Styles.WHITE_COLOR, BlendMode.srcIn),
                        ),

                        if(StartTaskBloc.instance.videoAnswer != null)...[
                          8.verticalSpace,
                          Text(
                            "${StartTaskBloc.instance.videoAnswer?.path.split("/").last}",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.w300.copyWith(
                              fontSize: 12,
                              color: Styles.WHITE_COLOR,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
