import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({super.key});

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
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage("https://s3-alpha-sig.figma.com/img/f6c7/0a58/8fa88d7db8bcd35dc4175ac5f9aa6591?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YMS4FRRnM9dnFsTjCQstZ5I48YW6KwSBm6oysMdnJDka2JZgkWhb81Ncwrx5Ohsj~LTpai9-lNtXCtSny2oB6m64HGyfTl1rNBMbhKUSKHrGjOiNrIXlh2Z0efMZy9LDN6qYiiR7rNzHA2RGUAbbEcA1K584U4n2k-bsHbs~CwilMnOA9~YGqHSHKr29JpA4Q-vUeSyPKQnpUWHJjxVUn4zDIrf-Pr5J3qDYFqbADBesQ4JAjUkfPkJzbfGNeW9m22pyV~zo-bBD8QXkitJeQmk1hDzaE4HXkHTUuUOskXQLnOb3qDH5EIOLvGrXfK6BeE7dUNjSmqy3XphbVrowBA__"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          32.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Styles.FILL_COLOR,
                backgroundImage: NetworkImage("https://s3-alpha-sig.figma.com/img/335f/6412/5ee06051627761293de643be6867113e?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JrUjFdDjOjXQ-KUHYl3nL~Hi2nWlx2yrVk89Dyum8fFCCiqZRRfgLZ-oxzO1nbc0s0ibjmyUt6EFOQEm0~NewlT2HyM3thlHoeZqEIevhXtX0msIrPQYdSEtpI2~J7Abyys8DDfcrYqCQXdhIO3VFLNkac4KUIrktkARycrEsqdo7aVrXWawAhDSX8uV7cZ4AT25~Qs2u~oiN6TOfWlKKSoKhXKUd~rwjc7ZoUoZDj3uQ5GvI2VcN2nQXWBQqpp5jry0Gg4qQ98RDrUphlMho90R4SOM-0MaVuxYNVRqZLR3TZjKyBdBNwU5kb-hak260rqeGbR9wBSn4NrOrh4apQ__"),
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Al Baik Restaurant",
                      style: AppTextStyles.w500.copyWith(fontSize: 16),
                    ),
                    4.verticalSpace,
                    Text(
                      "Italian Chinese Restaurant",
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
                  ],
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: Styles.GREEN_COLOR,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    "x10 Point",
                    style: AppTextStyles.w700.copyWith(
                      fontSize: 12,
                      color: Styles.WHITE_COLOR,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
