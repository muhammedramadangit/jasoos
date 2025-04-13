import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_storage.dart';
import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../../my_tasks/models/tasks_model.dart';

class RecentTaskCard extends StatelessWidget {
  final TaskInfo? model;
  const RecentTaskCard({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppStorage.cacheTaskRewards("${model?.reward}");
        CustomNavigator.push(Routes.TASK_DETAILS, arguments: model?.id);
      },
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 110.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Styles.FILL_COLOR,
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage(model?.shopImage ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 110.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.6),
                      Colors.black.withValues(alpha: 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),

              // PositionedDirectional(
              //   end: 6,
              //   top: 6,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Styles.WHITE_COLOR,
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Container(
              //       padding: EdgeInsets.symmetric(
              //           vertical: 2.h, horizontal: 8.w),
              //       decoration: BoxDecoration(
              //         color: Styles.RED_TEXT_COLOR.withValues(
              //             alpha: 0.05),
              //         borderRadius: BorderRadius.circular(100),
              //       ),
              //       child: Center(
              //         child: Text(
              //           "50% OFF",
              //           style: AppTextStyles.w700.copyWith(
              //             fontSize: 12,
              //             color: Styles.RED_TEXT_COLOR,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.name ?? "",
                  maxLines: 2,
                  style: AppTextStyles.w500.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
                4.verticalSpace,
                Text(
                  model?.shop ?? "",
                  maxLines: 2,
                  style: AppTextStyles.w300.copyWith(fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
                4.verticalSpace,
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       Constants.getSvg("routing"),
                //       colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                //     ),
                //     SizedBox(width: 4.w),
                //     Text(
                //       "${model?.branch}",
                //       style: AppTextStyles.w400.copyWith(
                //         color: Styles.DARK_TEXT_COLOR,
                //         fontSize: 12,
                //       ),
                //     ),
                //   ],
                // ),
                // 4.verticalSpace,
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
                // 4.verticalSpace,
                if(model?.totalQuestions != 0 && (model?.totalQuestions == model?.answeredQuestions))...[
                  Row(
                    children: [
                      SvgPicture.asset(Constants.getSvg("star"), colorFilter: ColorFilter.mode(Styles.GREEN_COLOR, BlendMode.srcIn),),
                      4.horizontalSpace,
                      Text(
                        "${tr("earned")} ${model?.reward}",
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 12,
                          color: Styles.GREEN_COLOR,
                        ),
                      ),
                      4.horizontalSpace,
                      SvgPicture.asset(Constants.getSvg("riyal"), colorFilter: ColorFilter.mode(Styles.GREEN_COLOR, BlendMode.srcIn),),
                    ],
                  ),
                ]else...[
                  Row(
                    children: [
                      SvgPicture.asset(Constants.getSvg("star"), colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),),
                      4.horizontalSpace,
                      Text(
                        "${tr("reward")} ${model?.reward}",
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 12,
                          color: Styles.PRIMARY_COLOR,
                        ),
                      ),
                      4.horizontalSpace,
                      SvgPicture.asset(Constants.getSvg("riyal")),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
