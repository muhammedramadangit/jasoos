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
              height: 140.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Styles.BORDER_COLOR.withValues(alpha: 0.2),
                image: DecorationImage(
                  image: NetworkImage(model?.shopImage ?? ""),
                  // image: NetworkImage("https://albaikmenu.net/wp-content/uploads/2024/10/albaik-1-1.webp"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            8.verticalSpace,
            Text(
              model?.shop ?? "",
              maxLines: 2,
              style: AppTextStyles.w500.copyWith(fontSize: 14, overflow: TextOverflow.ellipsis),
            ),
            8.verticalSpace,

            if(isComplete == true)...[
              Row(
                children: [
                  SvgPicture.asset(Constants.getSvg("star"), colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),),
                  4.horizontalSpace,
                  Text(
                    "Earned ${model?.reward}",
                    style: AppTextStyles.w500.copyWith(
                      fontSize: 12,
                      color: Styles.PRIMARY_COLOR,
                    ),
                  ),
                  4.horizontalSpace,
                  SvgPicture.asset(Constants.getSvg("riyal")),
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
                  8.horizontalSpace,
                  SvgPicture.asset(
                    Constants.getSvg("discount-round"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Valid till ${model?.endDate}",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              // 8.verticalSpace,
              // Row(
              //   children: [
              //     SvgPicture.asset(
              //       Constants.getSvg("discount-round"),
              //       colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
              //     ),
              //     SizedBox(width: 4.w),
              //     Text(
              //       model?.type ?? "",
              //       style: AppTextStyles.w400.copyWith(
              //         color: Styles.DARK_TEXT_COLOR,
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
              8.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(Constants.getSvg("star"), colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),),
                  4.horizontalSpace,
                  Text(
                    "Reward ${model?.reward}",
                    style: AppTextStyles.w500.copyWith(
                      fontSize: 12,
                      color: Styles.PRIMARY_COLOR,
                    ),
                  ),
                  4.horizontalSpace,
                  SvgPicture.asset(Constants.getSvg("riyal")),
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
                  8.horizontalSpace,
                  SvgPicture.asset(
                    Constants.getSvg("discount-round"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Valid till ${model?.endDate}",
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
