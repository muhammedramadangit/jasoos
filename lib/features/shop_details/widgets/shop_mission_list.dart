import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/home/models/shops_model.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class ShopMissionList extends StatelessWidget {
  final ShopInfo? model;
  const ShopMissionList({super.key, this.model});

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
                  "${model?.tasksCount} Missions is available",
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
            itemCount: model!.tasks!.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => 8.horizontalSpace,
            itemBuilder: (context, index) {
              Tasks? task = model?.tasks?[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: 180.w,
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
                              task?.name ?? "",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                            4.verticalSpace,
                            Text(
                              "${task?.reward} Point",
                              style: AppTextStyles.w500.copyWith(
                                fontSize: 12,
                                color: Styles.PRIMARY_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Icon(Icons.arrow_forward_ios, size: 16, color: Styles.DARK_GREY_COLOR),

                      // if(index.isEven)...[
                      // ]else...[
                      //   Icon(Icons.check_box, size: 16, color: Styles.GREEN_COLOR),
                      // ],
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
