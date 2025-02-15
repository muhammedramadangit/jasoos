import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../widgets/my_tasks_categories_list.dart';
import '../widgets/my_tasks_list.dart';


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
            MyTasksList(title: "On Going Mission"),
            24.verticalSpace,
            MyTasksList(title: "Added New"),
            24.verticalSpace,
            MyTasksList(title: "Completed", isComplete: true),
          ],
        ),
      ),
    );
  }
}
