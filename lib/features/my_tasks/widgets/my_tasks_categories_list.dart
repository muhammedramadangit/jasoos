import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/tasks_status_bloc.dart';
import '../models/tasts_status_model.dart';

class MyTasksCategoriesList extends StatefulWidget {
  const MyTasksCategoriesList({super.key});

  @override
  State<MyTasksCategoriesList> createState() => _MyTasksCategoriesListState();
}

class _MyTasksCategoriesListState extends State<MyTasksCategoriesList> {
  // int? selected;
  //
  // @override
  // void initState() {
  //   selected = 0;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksStatusBloc, AppState>(
      builder: (context, state) {
        if(state is Loading) {
          return CustomLoading();
        } else if (state is Error) {
          return CustomCenterText(state.error ?? tr("errorException"));
        } else if (state is Empty) {
          return SizedBox();
        } else {
          TasksStatusBloc bloc = TasksStatusBloc.instance;
          return SizedBox(
            height: 34.h,
            child: ListView.separated(
              itemCount: bloc.tasksStatusList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => 8.horizontalSpace,
              itemBuilder: (context, index) {
                TaskStatusInfo ele = bloc.tasksStatusList[index];
                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   selected = index;
                    // });
                    bloc.onChangeTaskStatus(ele.value);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: bloc.taskStatus == ele.value ? Styles.PRIMARY_COLOR : Styles
                          .BORDER_COLOR.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ele.name ?? "",
                      style: AppTextStyles.w500.copyWith(
                        fontSize: 12,
                        color: bloc.taskStatus == ele.value ? Styles.WHITE_COLOR : Styles
                            .PRIMARY_COLOR,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
