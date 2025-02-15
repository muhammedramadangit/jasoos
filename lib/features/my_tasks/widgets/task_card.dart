import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';

class TaskCard extends StatelessWidget {
  final bool? isComplete;
  const TaskCard({super.key, this.isComplete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigator.push(Routes.MY_TASK_DETAILS);
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
                image: DecorationImage(
                  image: NetworkImage("https://s3-alpha-sig.figma.com/img/f6c7/0a58/8fa88d7db8bcd35dc4175ac5f9aa6591?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YMS4FRRnM9dnFsTjCQstZ5I48YW6KwSBm6oysMdnJDka2JZgkWhb81Ncwrx5Ohsj~LTpai9-lNtXCtSny2oB6m64HGyfTl1rNBMbhKUSKHrGjOiNrIXlh2Z0efMZy9LDN6qYiiR7rNzHA2RGUAbbEcA1K584U4n2k-bsHbs~CwilMnOA9~YGqHSHKr29JpA4Q-vUeSyPKQnpUWHJjxVUn4zDIrf-Pr5J3qDYFqbADBesQ4JAjUkfPkJzbfGNeW9m22pyV~zo-bBD8QXkitJeQmk1hDzaE4HXkHTUuUOskXQLnOb3qDH5EIOLvGrXfK6BeE7dUNjSmqy3XphbVrowBA__"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            8.verticalSpace,
            Text(
              "Al Baik Resturant",
              style: AppTextStyles.w500.copyWith(fontSize: 14),
            ),
            8.verticalSpace,

            if(isComplete == true)...[
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
            ]else...[
              Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("routing"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "1 Mile",
                    style: AppTextStyles.w400.copyWith(
                      color: Styles.DARK_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    Constants.getSvg("discount-round"),
                    colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "valid till tuesday",
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
                            width: (56.w * 1) / 4,
                            decoration: BoxDecoration(
                              color: Styles.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "1/4",
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
