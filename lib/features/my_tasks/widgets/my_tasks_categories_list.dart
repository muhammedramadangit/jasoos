import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class MyTasksCategoriesList extends StatefulWidget {
  const MyTasksCategoriesList({super.key});

  @override
  State<MyTasksCategoriesList> createState() => _MyTasksCategoriesListState();
}

class _MyTasksCategoriesListState extends State<MyTasksCategoriesList> {
  int? selected;

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: selected == index ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "All Tasks",
                style: AppTextStyles.w500.copyWith(
                  fontSize: 12,
                  color: selected == index ? Styles.WHITE_COLOR : Styles.PRIMARY_COLOR,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
