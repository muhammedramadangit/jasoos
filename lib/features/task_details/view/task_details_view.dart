import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../widgets/how_it_work_info.dart';
import '../widgets/task_info_card.dart';
import '../widgets/task_mission_list.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Al Baik Task"),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Column(
          children: [
            TaskInfoCard(),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: () {
                  howItWorkBottomSheet();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(Constants.getSvg("info-circle")),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        "How it Works",
                        style: AppTextStyles.w500.copyWith(fontSize: 14),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Styles.DARK_GREY_COLOR),
                  ],
                ),
              ),
            ),
            Styles.divider(ver: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Constants.getSvg("routing"),
                      height: 18,
                      width: 18,
                      colorFilter: ColorFilter.mode(Styles.BLACK_COLOR, BlendMode.srcIn),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        "Navigate To Restaurant",
                        style: AppTextStyles.w500.copyWith(fontSize: 14),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Styles.DARK_GREY_COLOR),
                  ],
                ),
              ),
            ),

            24.verticalSpace,
            TaskMissionList(),
            16.verticalSpace,
            CustomButton(
              onTap: () {
                CustomNavigator.push(Routes.START_TASK);
              },
              text: "Start Task",
              textStyle: AppTextStyles.w500.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              color: Styles.BORDER_COLOR,
            ),

          ],
        ),
      ),
    );
  }
}
