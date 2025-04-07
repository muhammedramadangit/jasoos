import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/main_widgets/custom_check_box.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/questions_bloc.dart';
import '../models/questions_model.dart';

class MultiSelectTask extends StatefulWidget {
  final QuestionInfo? model;
  const MultiSelectTask({super.key, this.model});

  @override
  State<MultiSelectTask> createState() => _MultiSelectTaskState();
}

class _MultiSelectTaskState extends State<MultiSelectTask> {
  bool isSelected = false;

  @override
  void initState() {
    // for(int i = 0; i < widget.model!.options!.length; i++) {
    //   QuestionsBloc.instance.selectedProblem.add(false);
    // }
    super.initState();
  }

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
                              widget.model?.question ?? "",
                              style: AppTextStyles.w700.copyWith(
                                fontSize: 24,
                                color: Styles.WHITE_COLOR,
                              ),
                            ),
                            24.verticalSpace,
                            ListView.separated(
                              itemCount: widget.model!.options!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: ClampingScrollPhysics(),
                              separatorBuilder: (context, index) => 16.verticalSpace,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: bloc.selectedProblem[index] == true ? Styles.BLUE_COLOR : Styles.SELECT_BACKGROUND_COLOR,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(color: bloc.selectedProblem[index] == true ? Styles.BLUE_COLOR : Styles.SELECT_BACKGROUND_COLOR),
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckBox(
                                        isSelected: bloc.selectedProblem[index] == true,
                                        selectedColor: Styles.BLUE_COLOR,
                                        radius: 100,
                                        size: 16,
                                        onChanged: (value) {
                                          bloc.onSelectProblem(value, index);
                                          bloc.add(Update());
                                          if (StartTaskBloc.instance.multiSelectedAnswer.any((element) => element == widget.model!.options?[index])) {
                                            StartTaskBloc.instance.multiSelectedAnswer.removeWhere((element) => element == widget.model!.options?[index]);
                                          } else {
                                            StartTaskBloc.instance.multiSelectedAnswer.add(widget.model!.options![index]);
                                          }
                                        },
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        widget.model?.options?[index] ?? "",
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 16,
                                          color: Styles.WHITE_COLOR,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            // ...List.generate(
                            //   widget.model!.options!.length,
                            //       (index) {
                            //     if (widget.selectValue != null) {
                            //       isSelected = widget.selectValue!.any(
                            //               (element) => element.value == widget.values[index].value);
                            //     }
                            //     return ListTile(
                            //       splashColor: Colors.transparent,
                            //       onTap: () {
                            //         if (selectedList.any((element) =>
                            //         element.value == widget.values[index].value)) {
                            //           selectedList.removeWhere((element) =>
                            //           element.value == widget.values[index].value);
                            //         } else {
                            //           selectedList.add(widget.values[index]);
                            //         }
                            //         setState(() {});
                            //       },
                            //       minLeadingWidth: 0,
                            //       dense: true,
                            //       contentPadding: EdgeInsets.zero,
                            //       leading: CheckBoxView(isChecked: isSelected),
                            //       title: Text(
                            //         widget.values[index].label,
                            //         style: AppTextStyles.w500.copyWith(fontSize: 14),
                            //       ),
                            //     );
                            //   },
                            // ),
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
