import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../core/app_storage.dart';
import '../../../helper/constants.dart';
import '../models/tasks_model.dart';

class TaskCard extends StatelessWidget {
  final bool? isComplete;
  final bool? isRecent;
  final TaskInfo? model;
  const TaskCard({super.key, this.isComplete = false, this.isRecent = false, this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppStorage.cacheTaskRewards("${model?.reward}");
        CustomNavigator.push(Routes.TASK_DETAILS, arguments: model?.id);
      },
      child: Container(
        width: 195.w,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Styles.FILL_COLOR,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQueryHelper.width,
              height: 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Styles.BORDER_COLOR.withValues(alpha: 0.2),
                image: DecorationImage(
                  image: NetworkImage(model?.shopImage ?? ""),
                  fit: BoxFit.cover,
                )
              ),
            ),
            8.verticalSpace,
            Text(
              model?.name ?? "",
              style: AppTextStyles.w500.copyWith(fontSize: 14),
            ),
            4.verticalSpace,
            Text(
              model?.shop ?? "",
              style: AppTextStyles.w300.copyWith(fontSize: 12, color: Styles.DARK_TEXT_COLOR),
            ),
            8.verticalSpace,

            if(isComplete == true)...[
              Row(
                children: [
                  SvgPicture.asset(Constants.getSvg("star")),
                  4.horizontalSpace,
                  Text(
                    "Earned ${model?.reward} Points",
                    style: AppTextStyles.w500.copyWith(
                      fontSize: 12,
                      color: Styles.GREEN_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ]else if(isRecent == true)...[
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("routing"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    model?.distance ?? "",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("discount-round"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    model?.type ?? "",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(Constants.getSvg("star")),
                  4.horizontalSpace,
                  Text(
                    "Reward ${model?.reward} Points",
                    style: AppTextStyles.w500.copyWith(
                      fontSize: 12,
                      color: Styles.GREEN_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ]else...[
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("routing"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    model?.distance ?? "",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("discount-round"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    model?.type ?? "",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    "Tasks",
                    style: AppTextStyles.w400.copyWith(fontSize: 12),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 6,
                            width: 56.w,
                            decoration: BoxDecoration(
                              color: Styles.BORDER_COLOR,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          Container(
                            height: 6,
                            width: (int.parse("${model?.answeredQuestions}") + int.parse("${model?.totalQuestions}")) == 0 ? 56.w : (56.w * int.parse("${model?.answeredQuestions}")) / (int.parse("${model?.answeredQuestions}") + int.parse("${model?.totalQuestions}")),
                            decoration: BoxDecoration(
                              color: Styles.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "${model?.answeredQuestions}/${int.parse("${model?.answeredQuestions}") + int.parse("${model?.totalQuestions}")}",
                        style: AppTextStyles.w700.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
