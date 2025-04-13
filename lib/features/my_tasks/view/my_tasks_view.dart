import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_empty_view.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/my_tasks_bloc.dart';
import '../widgets/my_tasks_categories_list.dart';
import '../widgets/task_card.dart';


class MyTasksView extends StatelessWidget {
  const MyTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("myTasks"), center: false, back: false, leadingWidth: 0),
      body: Column(
        children: [
          16.verticalSpace,
          MyTasksCategoriesList(),
          8.verticalSpace,
          Expanded(
            child: BlocBuilder<MyTasksBloc, AppState>(
              builder: (context, state) {
                if(state is Loading) {
                  return CustomLoading();
                } else if (state is Error) {
                  return CustomCenterText(state.error ?? tr("errorException"));
                } else if (state is Empty) {
                  return CustomEmptyView();
                } else {
                  MyTasksBloc bloc = MyTasksBloc.instance;
                  return ListView.separated(
                    itemCount: bloc.model.data!.length,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) => 12.verticalSpace,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        model: bloc.model.data?[index],
                        isComplete: bloc.model.data?[index] == 2,
                        isRecent: bloc.model.data?[index] == 0,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
