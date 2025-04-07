import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../models/task_details_model.dart';

class TaskInfoCard extends StatelessWidget {
  final TaskDetailsInfo? model;
  const TaskInfoCard({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            width: MediaQueryHelper.width,
            height: 250.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage(model?.shopImage ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          24.verticalSpace,

          if(model?.status == 2)...[
            Row(
              children: [
                4.horizontalSpace,
                SvgPicture.asset(Constants.getSvg("stop")),
                4.horizontalSpace,
                Text(
                  "Completed",
                  style: AppTextStyles.w500.copyWith(
                    fontSize: 12,
                    color: Styles.GREEN_COLOR,
                  ),
                )
              ],
            ),
            24.verticalSpace,
          ]else if(model?.status == 4)...[
            Row(
              children: [
                4.horizontalSpace,
                SvgPicture.asset(
                  Constants.getSvg("stop"),
                  colorFilter: ColorFilter.mode(
                    Styles.RED_COLOR,
                    BlendMode.srcIn,
                  ),
                ),
                4.horizontalSpace,
                Text(
                  "Rejected",
                  style: AppTextStyles.w500.copyWith(
                    fontSize: 12,
                    color: Styles.RED_COLOR,
                  ),
                )
              ],
            ),
            24.verticalSpace,
          ],

          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.grey[100],
                backgroundImage: NetworkImage(model?.shopImage ?? ""),
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model?.name ?? "",
                      style: AppTextStyles.w500.copyWith(fontSize: 16),
                    ),
                    4.verticalSpace,
                    Text(
                      model?.shop ?? "",
                      style: AppTextStyles.w400.copyWith(fontSize: 14),
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.getSvg("routing"),
                          colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          model?.branch ?? "",
                          style: AppTextStyles.w400.copyWith(
                            color: Styles.DARK_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                        // SizedBox(width: 4.w),
                        // SvgPicture.asset(
                        //   Constants.getSvg("discount-round"),
                        //   colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                        // ),
                        // SizedBox(width: 4.w),
                        // Text(
                        //   "Valid till ${model?.endDate}",
                        //   style: AppTextStyles.w400.copyWith(
                        //     color: Styles.DARK_TEXT_COLOR,
                        //     fontSize: 12,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              // 8.horizontalSpace,
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              //   decoration: BoxDecoration(
              //     color: Styles.GREEN_COLOR,
              //     borderRadius: BorderRadius.circular(8.r),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "x10 Point",
              //       style: AppTextStyles.w700.copyWith(
              //         fontSize: 12,
              //         color: Styles.WHITE_COLOR,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
