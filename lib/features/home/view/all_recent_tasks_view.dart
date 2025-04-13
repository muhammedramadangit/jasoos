import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../../../core/app_state.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/recent_tasks_bloc.dart';
import '../widgets/recent_task_card.dart';

class AllRecentTasksView extends StatelessWidget {
  const AllRecentTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("recentTasks")),
      body: BlocBuilder<RecentTasksBloc, AppState>(
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemBuilder: (context, index) {
                return RecentTaskCard(model: bloc.model.data?[index]);
              },
            );
          }
        },
      ),
    );
  }
}
