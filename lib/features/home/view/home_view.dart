import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/home/widgets/complete_profile.dart';
import 'package:jasoos/features/home/widgets/home_appbar.dart';
import 'package:jasoos/features/home/widgets/home_slider.dart';
import 'package:jasoos/helper/text_styles.dart';

import '../../../helper/styles.dart';
import '../widgets/home_categories_list.dart';
import '../widgets/nearest_tasks_list.dart';
import '../widgets/recent_tasks_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Hi, Muhamad👋",
                style: AppTextStyles.w500.copyWith(fontSize: 24),
              ),
            ),
            CompleteProfile(),
            HomeSlider(),
            16.verticalSpace,
            _ViewAll(
              title: "Choose categories",
              onView: () {},
            ),
            HomeCategoriesList(),
            16.verticalSpace,
            _ViewAll(
              title: "Nearest Tasks",
              onView: () {},
            ),
            NearestTasksList(),
            16.verticalSpace,
            _ViewAll(title: "Recent Tasks"),
            RecentTasksList(),
          ],
        ),
      ),
    );
  }
}


class _ViewAll extends StatelessWidget {
  final String title;
  final VoidCallback? onView;
  const _ViewAll({required this.title, this.onView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.w500.copyWith(fontSize: 16),
            ),
          ),

          if(onView != null)
            InkWell(
              onTap: onView,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                "View all",
                style: AppTextStyles.w500.copyWith(
                  fontSize: 12,
                  color: Styles.GREY_TEXT_COLOR,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
