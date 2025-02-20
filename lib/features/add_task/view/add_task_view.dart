import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/bloc/add_task_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AppState>(
      builder: (context, state) {
        AddTaskBloc bloc = AddTaskBloc.instance;
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
            titleWidget: Row(
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
                      width: (48.w * (bloc.index+1)) / bloc.tasks.length,
                      decoration: BoxDecoration(
                        color: Styles.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                Text(
                  "${bloc.index+1}/${bloc.tasks.length}",
                  style: AppTextStyles.w700.copyWith(fontSize: 12, color: Styles.WHITE_COLOR),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => CustomNavigator.pop(),
                icon: Icon(Icons.close, color: Styles.WHITE_COLOR),
              )
            ],
          ),
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
                bloc.tasks[bloc.index],
                Spacer(),
                CustomButton(
                  text: bloc.index == 2 ? "Continue" : "Next",
                  onTap: () {
                    bloc.nextTask();
                  },
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
