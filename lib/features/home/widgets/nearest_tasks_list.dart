import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/nearest_shop_bloc.dart';
import 'package:jasoos/helper/media_quary_helper.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../models/shops_model.dart';

class NearestTasksList extends StatelessWidget {
  const NearestTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearestShopsBloc, AppState>(
      builder: (context, state) {
        if(state is Loading) {
          return CustomLoading();
        } else if (state is Error) {
          return CustomCenterText(state.error ?? tr("errorException"));
        } else if (state is Empty) {
          return CustomEmptyView();
        } else {
          NearestShopsBloc bloc = NearestShopsBloc.instance;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.h,
                child: ListView.separated(
                  itemCount: bloc.model.data!.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => 16.horizontalSpace,
                  itemBuilder: (context, index) {
                    ShopInfo? shop = bloc.model.data?[index];
                    return GestureDetector(
                      onTap: () {
                        CustomNavigator.push(Routes.TASK_DETAILS, arguments: shop?.id);
                      },
                      child: Container(
                        width: 280.w,
                        decoration: BoxDecoration(
                          color: Styles.WHITE_COLOR,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: Colors.black.withValues(alpha: 0.04),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: DecorationImage(
                                        image: AssetImage(shop?.image ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.black.withValues(alpha: 0),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQueryHelper.width,
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Styles.WHITE_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(100.r),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 10,
                                                backgroundColor:
                                                Styles.GREEN_TEXT_COLOR,
                                                child: Center(
                                                  child: SvgPicture.asset(Constants.getSvg("medal-star")),
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                shop?.taskName ?? "",
                                                style: AppTextStyles.w500.copyWith(
                                                  fontSize: 12,
                                                  color: Styles.GREEN_TEXT_COLOR,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                shop?.name ?? "",
                                                style: AppTextStyles.w500.copyWith(
                                                  color: Styles.WHITE_COLOR,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shop?.name ?? "",
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                      4.verticalSpace,
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Constants.getSvg("routing"),
                                            colorFilter: ColorFilter.mode(
                                              Styles.DARK_GREY_COLOR,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            shop?.distance ?? "",
                                            style: AppTextStyles.w400.copyWith(
                                              color: Styles.DARK_GREY_COLOR,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          SvgPicture.asset(
                                            Constants.getSvg("medal-star"),
                                            colorFilter: ColorFilter.mode(
                                                Styles.DARK_GREY_COLOR,
                                                BlendMode.srcIn),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            "${shop?.tasksCount} Mission",
                                            style: AppTextStyles.w400.copyWith(
                                              color: Styles.DARK_GREY_COLOR,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Spacer(),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       vertical: 2.h, horizontal: 4.w),
                                  //   decoration: BoxDecoration(
                                  //     color:
                                  //     Styles.BLACK_COLOR.withValues(alpha: 0.95),
                                  //     borderRadius: BorderRadius.circular(4),
                                  //   ),
                                  //   child: Center(
                                  //     child: Text(
                                  //       "50% OFF",
                                  //       style: AppTextStyles.w500.copyWith(
                                  //         fontSize: 12,
                                  //         color: Styles.WHITE_COLOR,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
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
      },
    );
  }
}
