import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/my_tasks/widgets/task_card.dart';
import 'package:jasoos/helper/text_styles.dart';

class MyTasksList extends StatelessWidget {
  final String? title;
  final bool? isComplete;
  const MyTasksList({super.key, this.title, this.isComplete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title ?? "",
            style: AppTextStyles.w500.copyWith(fontSize: 18),
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: isComplete == true ? 188.h : 214.h,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => 12.horizontalSpace,
            itemBuilder: (context, index) {
              return TaskCard(isComplete: isComplete);
            },
          ),
        ),
      ],
    );
  }
}
