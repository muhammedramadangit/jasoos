import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class TaskMissionList extends StatelessWidget {
  const TaskMissionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(
                Constants.getSvg("medal-star"),
                height: 18,
                width: 18,
                colorFilter: ColorFilter.mode(Styles.BLACK_COLOR, BlendMode.srcIn),
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  "4 Missions is avaliable",
                  style: AppTextStyles.w500.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 66.h,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => 8.horizontalSpace,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: 164.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Styles.BORDER_COLOR.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Barista Tracker",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                            4.verticalSpace,
                            if(index.isEven)...[
                              Text(
                                "400 Point",
                                style: AppTextStyles.w500.copyWith(
                                  fontSize: 12,
                                  color: Styles.PRIMARY_COLOR,
                                ),
                              ),
                            ]else...[
                              Row(
                                children: [
                                  SvgPicture.asset(Constants.getSvg("star")),
                                  4.horizontalSpace,
                                  Text(
                                    "Earned 50 Points",
                                    style: AppTextStyles.w500.copyWith(
                                      fontSize: 12,
                                      color: Styles.GREEN_TEXT_COLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),

                      if(index.isEven)...[
                        Icon(Icons.arrow_forward_ios, size: 16, color: Styles.DARK_GREY_COLOR),
                      ]else...[
                        Icon(Icons.check_box, size: 16, color: Styles.GREEN_COLOR),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
