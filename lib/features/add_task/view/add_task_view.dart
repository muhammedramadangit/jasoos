import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/bloc/questions_bloc.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_empty_view.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, AppState>(
      builder: (context, state) {
        QuestionsBloc bloc = QuestionsBloc.instance;
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBars.titledAppBar(
            color: Colors.transparent,
            leading: IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
                bloc.previousTask();
              },
              icon: Icon(
                Platform.isAndroid
                    ? Icons.arrow_back
                    : Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            titleWidget: state is Done || state is Initial ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 8,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: Styles.DARK_GREY_COLOR,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    Container(
                      height: 8,
                      width: (48.w * (bloc.index+1)) / bloc.model.data!.length,
                      decoration: BoxDecoration(
                        color: Styles.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                Text(
                  "${bloc.index+1}/${bloc.model.data!.length}",
                  style: AppTextStyles.w700.copyWith(fontSize: 12, color: Styles.WHITE_COLOR),
                ),
              ],
            ) : SizedBox(),
            actions: [
              IconButton(
                onPressed: () => CustomNavigator.pop(),
                icon: Icon(Icons.close, color: Styles.WHITE_COLOR),
              )
            ],
          ),
          body: state is Loading
              ? CustomLoading()
              : state is Error
              ? CustomCenterText(state.error ?? tr("errorException"))
              : state is Empty
              ? CustomEmptyView()
              : Container(
            height: MediaQueryHelper.height,
            width: MediaQueryHelper.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constants.getAsset("task-backgroud1")),
                fit: BoxFit.cover,
              ),
            ),
            child: BlocBuilder<StartTaskBloc, AppState>(
              builder: (context, startState) {
                return SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      // if(bloc.model.data!.length > 3 &&
                      //     ((bloc.model.data!.length.isEven && (bloc.index == bloc.model.data!.length/2))
                      //         || (bloc.model.data!.length.isOdd && (bloc.index == (bloc.model.data!.length/2).floor()))
                      //     ))...[
                      //   TaskDone(),
                      // ]else...[
                      //   bloc.tasks[bloc.index],
                      // ],
                      bloc.tasks[bloc.index],
                      Spacer(),
                      CustomButton(
                        text: "Next",
                        loading: startState is Loading,
                        onTap: () {
                          StartTaskBloc.instance.add(Update());
                          StartTaskBloc.instance.checkValidation({
                            "question_id" : bloc.model.data?[bloc.index].id,
                            "question_type_id" : bloc.model.data?[bloc.index].questionTypeId,
                          });
                        },
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        );
      },
    );
  }
}
