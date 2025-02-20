import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:lottie/lottie.dart';

import '../../../helper/media_quary_helper.dart';
import '../../../main_widgets/custom_button.dart';

class TaskComplete extends StatelessWidget {
  const TaskComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQueryHelper.height,
        width: MediaQueryHelper.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.getAsset("task-background")),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      120.verticalSpace,
                      Image.asset(Constants.getAsset("cup")),
                      24.verticalSpace,
                      Text(
                        "Congratulations",
                        style: AppTextStyles.w700.copyWith(
                          fontSize: 24,
                          color: Styles.WHITE_COLOR,
                        ),
                      ),
                      16.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "You’ve completed all the tasks and earned 50 points!",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.w500.copyWith(
                            fontSize: 14,
                            color: Styles.WHITE_COLOR,
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: Color(0xff282928).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "You've Earned 50 Points!",
                                  style: AppTextStyles.w700.copyWith(
                                    fontSize: 16,
                                    color: Styles.WHITE_COLOR,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  "Keep going to unlock rewards!",
                                  style: AppTextStyles.w400.copyWith(
                                    fontSize: 14,
                                    color: Styles.WHITE_COLOR,
                                  ),
                                ),
                              ],
                            ),
                            10.horizontalSpace,
                            Text(
                              "50 points",
                              style: AppTextStyles.w500.copyWith(
                                fontSize: 16,
                                color: Styles.WHITE_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff282928).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              child: Text(
                                "Explore More Restaurant Tasks",
                                style: AppTextStyles.w700.copyWith(
                                  fontSize: 16,
                                  color: Styles.WHITE_COLOR,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 125.h,
                              child: ListView.separated(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                separatorBuilder: (context, index) => 16.horizontalSpace,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 300.w,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Styles.BACKGROUND_COLOR,
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12.r),
                                          child: Image.network(
                                            "https://images.pexels.com/photos/18294662/pexels-photo-18294662/free-photo-of-restaurant-and-street-with-cars-at-night.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                            width: 90,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        16.horizontalSpace,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Al Baik Restaurant",
                                                style: AppTextStyles.w800.copyWith(
                                                  fontSize: 16,
                                                  color: Styles.WHITE_COLOR,
                                                ),
                                              ),
                                              8.verticalSpace,
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Constants.getSvg("routing"),
                                                    colorFilter: ColorFilter.mode(
                                                        Styles.WHITE_COLOR,
                                                        BlendMode.srcIn),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    "1 Mile",
                                                    style: AppTextStyles.w500.copyWith(
                                                      color: Styles.WHITE_COLOR,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  SvgPicture.asset(
                                                    Constants.getSvg("discount-round"),
                                                    colorFilter: ColorFilter.mode(
                                                        Styles.WHITE_COLOR,
                                                        BlendMode.srcIn),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    "valid till tuesday",
                                                    style: AppTextStyles.w500.copyWith(
                                                      color: Styles.WHITE_COLOR,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              8.verticalSpace,
                                              Text(
                                                "View Details",
                                                style: AppTextStyles.w400.copyWith(
                                                  color: Styles.WHITE_COLOR,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            16.verticalSpace,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                Center(
                  child: Lottie.asset(Constants.getLottie("celebrate"),
                  height: MediaQueryHelper.height / 1.2),
                ),

              ],
            ),

            Spacer(),
            CustomButton(
              text: "Continue Home",
              prefixIcon: SvgPicture.asset(
                Constants.getSvg("home"),
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onTap: () {
                CustomNavigator.push(Routes.MAIN_PAGES);
              },
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
            ),
          ],
        ),
      ),
    );
  }
}
