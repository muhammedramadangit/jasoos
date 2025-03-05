import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../widgets/added_new_tasks_list.dart';
import '../widgets/completed_tasks_list.dart';
import '../widgets/my_tasks_categories_list.dart';
import '../widgets/ongoing_tasks_list.dart';


class MyTasksView extends StatelessWidget {
  const MyTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "My Tasks", center: false, back: false, leadingWidth: 0),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
            MyTasksCategoriesList(),
            24.verticalSpace,
            OngoingTasksList(),
            24.verticalSpace,
            AddedNewTasksList(),
            24.verticalSpace,
            CompletedTasksList(),
          ],
        ),
      ),
    );
  }
}
