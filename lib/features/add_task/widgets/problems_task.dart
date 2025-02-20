import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_radio.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/add_task_bloc.dart';

class ProblemsTask extends StatelessWidget {
  const ProblemsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AppState>(
      builder: (context, state) {
        AddTaskBloc bloc = AddTaskBloc.instance;
        return Container(
          constraints: BoxConstraints(maxHeight: 550.h),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQueryHelper.width,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color(0xff282928).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select an answer",
                              style: AppTextStyles.w700.copyWith(
                                fontSize: 14,
                                color: Styles.WHITE_COLOR,
                              ),
                            ),
                            16.verticalSpace,
                            SvgPicture.asset(Constants.getSvg("rocket"), height: 40, width: 40),
                            12.verticalSpace,
                            Text(
                              "How would you rate the quality of service you received?",
                              style: AppTextStyles.w700.copyWith(
                                fontSize: 24,
                                color: Styles.WHITE_COLOR,
                              ),
                            ),
                            24.verticalSpace,
                            ListView.separated(
                              itemCount: 5,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: ClampingScrollPhysics(),
                              separatorBuilder: (context, index) => 16.verticalSpace,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: bloc.selectedProblem == index ? Styles.PRIMARY_COLOR : Styles.BACKGROUND_COLOR,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(color: bloc.selectedProblem == index ? Styles.BLUE_COLOR : Styles.BACKGROUND_COLOR)
                                  ),
                                  child: Row(
                                    children: [
                                      CustomRadio(
                                        value: index,
                                        groupValue: bloc.selectedProblem,
                                        onChanged: bloc.onSelectProblem,
                                        activeColor: Styles.BLUE_COLOR,
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        "Slow Service",
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 16,
                                          color: Styles.WHITE_COLOR,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQueryHelper.width,
                    height: 12.h,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xff282928).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
