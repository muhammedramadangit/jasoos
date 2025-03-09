import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/my_tasks/models/tasks_model.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';
import '../../../navigation/routes.dart';
import '../bloc/recent_tasks_bloc.dart';

class RecentTasksList extends StatelessWidget {
  const RecentTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentTasksBloc, AppState>(
      builder: (context, state) {
        if(state is Loading) {
          return CustomLoading();
        } else if (state is Error) {
          return CustomCenterText(state.error ?? tr("errorException"));
        } else if (state is Empty) {
          return CustomEmptyView();
        } else {
          RecentTasksBloc bloc = RecentTasksBloc.instance;
          return ListView.separated(
            itemCount: bloc.model.data!.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemBuilder: (context, index) {
              TaskInfo? task = bloc.model.data?[index];
              return GestureDetector(
                onTap: () {
                  AppStorage.cacheTaskRewards("${task?.reward}");
                  CustomNavigator.push(Routes.TASK_DETAILS, arguments: task?.id);
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
                              image: NetworkImage(task?.shopImage ?? ""),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task?.shop ?? "",
                          style: AppTextStyles.w500.copyWith(fontSize: 16),
                        ),
                        // 4.verticalSpace,
                        // Row(
                        //   children: [
                        //   ],
                        // ),
                        4.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Constants.getSvg("routing"),
                              colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "${task?.branch}",
                              style: AppTextStyles.w400.copyWith(
                                color: Styles.DARK_TEXT_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Constants.getSvg("discount-round"),
                              colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              task?.type ?? "",
                              style: AppTextStyles.w400.copyWith(
                                color: Styles.DARK_TEXT_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(Constants.getSvg("star")),
                            4.horizontalSpace,
                            Text(
                              "Reward ${task?.reward} Points",
                              style: AppTextStyles.w500.copyWith(
                                fontSize: 12,
                                color: Styles.GREEN_TEXT_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],

                ),
              );
            },
          );
        }
      },
    );
  }
}
