import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../navigation/custom_navigation.dart';

howItWorkBottomSheet() => showModalBottomSheet(
  isScrollControlled: true,
  isDismissible: true,
  enableDrag: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24.r),
      topRight: Radius.circular(24.r),
    ),
  ),
  backgroundColor: Colors.white,
  context: CustomNavigator.navigatorState.currentContext!,
  builder: (context) => HowItWorkBottomSheet(),
);

class HowItWorkBottomSheet extends StatelessWidget {
  const HowItWorkBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tips = [
      {
        "title" : "Choose Tasks",
        "description" : "Please provide your name and email",
      },
      {
        "title" : "Complete the Task",
        "description" : "A few details about your company",
      },
      {
        "title" : "Earn Rewards",
        "description" : "Finish the task and earn points to effort!",
      },
    ];
    return Container(
      width: MediaQueryHelper.width,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
              ),
              child: Row(
                children: [
                  Text(
                    "How it works",
                    style: AppTextStyles.w700.copyWith(fontSize: 24),
                  ),
                  Spacer(),
                  InkWell(
                    radius: 10,
                    onTap: () => CustomNavigator.pop(),
                    child: Icon(Icons.clear, size: 20),
                  ),
                ],
              ),
            ),

            Stepper(
              elevation: 0,
              onStepTapped: (value) {},
              physics: ClampingScrollPhysics(),
              currentStep: tips.length-1,
              stepIconHeight: 24.0,
              stepIconWidth: 24.0,
              stepIconMargin: EdgeInsets.symmetric(vertical: 8),
              onStepCancel: null,
              onStepContinue: null,
              controlsBuilder: (context, details) => SizedBox(),
              connectorThickness: 2,
              steps: tips.map((stepper) {
                return Step(
                  title: Text(
                    stepper["title"],
                    style: AppTextStyles.w500.copyWith(fontSize: 16),
                  ),
                  content: SizedBox(),
                  label: SizedBox(),
                  subtitle: Text(
                    stepper["description"],
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 14,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                  isActive: true,
                  state: StepState.indexed,
                );
              }).toList(),
            ),

            CustomButton(
              text: "Close",
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            SizedBox(height: 24.h)
          ],
        ),
      ),
    );
  }
}