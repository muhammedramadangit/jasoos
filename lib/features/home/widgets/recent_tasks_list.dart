import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/widgets/recent_task_card.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
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
          return CustomCenterText(tr("emptyTasks"));
        } else {
          RecentTasksBloc bloc = RecentTasksBloc.instance;
          return ListView.separated(
            itemCount: bloc.model.data!.length >= 3 ? 3 : bloc.model.data!.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemBuilder: (context, index) {
              return RecentTaskCard(model: bloc.model.data?[index]);
            },
          );
        }
      },
    );
  }
}
