import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/home_categories_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../../home/models/home_categories_model.dart';

AppBar discoverAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Styles.SCAFFOLD_COLOR,
    toolbarHeight: 80.h,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: BlocBuilder<HomeCategoriesBloc, AppState>(
        builder: (context, state) {
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else if (state is Empty) {
            return SizedBox();
          } else {
            HomeCategoriesBloc bloc = HomeCategoriesBloc.instance;
            return SizedBox(
              width: MediaQueryHelper.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Styles.WHITE_COLOR,
                      child: Center(
                        child: SvgPicture.asset(Constants.getSvg("logo")),
                      ),
                    ),

                    SizedBox(
                      height: 34.h,
                      child: ListView.separated(
                        itemCount: bloc.taskTypes!.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index) => 8.horizontalSpace,
                        itemBuilder: (context, index) {
                          HomeCategoryInfo? task = bloc.taskTypes?[index];
                          return GestureDetector(
                            onTap: () => bloc.onChangeTaskType(task?.id),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: bloc.selectedTaskType == task?.id ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Constants.getSvg("cup"),
                                    colorFilter: ColorFilter.mode(bloc.selectedTaskType == task?.id ? Styles.WHITE_COLOR : Styles.PRIMARY_COLOR , BlendMode.srcIn),
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    task?.name ?? "",
                                    style: AppTextStyles.w500.copyWith(
                                      fontSize: 12,
                                      color: bloc.selectedTaskType == task?.id ? Styles.WHITE_COLOR : Styles.PRIMARY_COLOR,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      ),
    ),
  );
}