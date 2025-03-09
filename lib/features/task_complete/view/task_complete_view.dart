import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_state.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../main_widgets/custom_button.dart';
import '../../../main_widgets/custom_loading.dart';
import '../../home/bloc/shops_bloc.dart';
import '../../home/models/shops_model.dart';

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
                          "You’ve completed all the tasks and earned ${AppStorage.getTaskRewards} points!",
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
                                  "You've Earned ${AppStorage.getTaskRewards} Points!",
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
                            Container(
                              height: 36.h,
                              width: 0.5,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              color: Styles.WHITE_COLOR,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${AppStorage.getTaskRewards}",
                                  style: AppTextStyles.w500.copyWith(
                                    fontSize: 16,
                                    color: Styles.WHITE_COLOR,
                                  ),
                                ),
                                Text(
                                  "points",
                                  style: AppTextStyles.w500.copyWith(
                                    fontSize: 12,
                                    color: Styles.WHITE_COLOR,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      BlocBuilder<ShopsBloc, AppState>(
                        builder: (context, state) {
                          if(state is Loading) {
                            return CustomLoading(color: Styles.WHITE_COLOR);
                          } else if (state is Error) {
                            return SizedBox();
                          } else if (state is Empty) {
                            return SizedBox();
                          } else {
                            ShopsBloc bloc = ShopsBloc.instance;
                            return Container(
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
                                    height: 140.h,
                                    child: ListView.separated(
                                      itemCount: bloc.model.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      separatorBuilder: (context, index) => 16.horizontalSpace,
                                      itemBuilder: (context, index) {
                                        ShopInfo? shop = bloc.model.data?[index];
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
                                                  shop?.image ?? "",
                                                  width: 90,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container(
                                                      width: 90,
                                                      height: 80,
                                                      color: Colors.grey[100],
                                                      child: Center(
                                                        child: Image.asset(
                                                          Constants.getAsset("w-logo"),
                                                          height: 46,
                                                          width: 46,
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                                                      shop?.name ?? "",
                                                      maxLines: 2,
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
                            );
                          }
                        },
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
                AppStorage.cacheTaskRewards("");
                CustomNavigator.push(Routes.MAIN_PAGES, clean: true);
              },
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
            ),
          ],
        ),
      ),
    );
  }
}
