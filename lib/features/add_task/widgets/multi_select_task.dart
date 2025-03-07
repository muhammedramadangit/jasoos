import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/main_widgets/custom_check_box.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/questions_bloc.dart';
import '../models/questions_model.dart';

class MultiSelectTask extends StatelessWidget {
  final QuestionInfo? model;
  const MultiSelectTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, AppState>(
      builder: (context, state) {
        QuestionsBloc bloc = QuestionsBloc.instance;
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
                              model?.question ?? "",
                              style: AppTextStyles.w700.copyWith(
                                fontSize: 24,
                                color: Styles.WHITE_COLOR,
                              ),
                            ),
                            24.verticalSpace,
                            ListView.separated(
                              itemCount: model!.options!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: ClampingScrollPhysics(),
                              separatorBuilder: (context, index) => 16.verticalSpace,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: bloc.selectedProblem?[index] == true ? Styles.PRIMARY_COLOR : Styles.BACKGROUND_COLOR,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(color: bloc.selectedProblem?[index] == true ? Styles.BLUE_COLOR : Styles.BACKGROUND_COLOR)
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckBox(
                                        isSelected: bloc.selectedProblem?[index],
                                        onChanged: (value) {
                                          bloc.onSelectProblem(value, index);
                                          if (StartTaskBloc.instance.multiSelectedAnswer.any((element) => element == model!.options?[index])) {
                                            StartTaskBloc.instance.multiSelectedAnswer.removeWhere((element) =>
                                            element == model!.options?[index]);
                                          } else {
                                            StartTaskBloc.instance.multiSelectedAnswer.add(model!.options![index]);
                                          }
                                          print("object ${StartTaskBloc.instance.multiSelectedAnswer}");
                                        },
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        model?.options?[index] ?? "",
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
