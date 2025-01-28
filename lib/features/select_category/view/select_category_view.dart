import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/select_category/widgets/categories_grid.dart';
import 'package:jasoos/features/select_category/widgets/select_category_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Text(
              "What type of category are you interested in?",
              style: AppTextStyles.w500.copyWith(fontSize: 28),
            ),
            SizedBox(height: 8.h),
            Text(
              "Tell us what you’re interested in so we can customise the app for your needs.",
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(child: CategoriesGrid()),
            SizedBox(height: 24.h),
            SelectCategorySubmit(),
          ],
        ),
      ),
    );
  }
}
