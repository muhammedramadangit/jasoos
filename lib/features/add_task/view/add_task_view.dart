import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  double? selectedRate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBars.titledAppBar(
          color: Colors.transparent,
          leading: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 8,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: Styles.DARK_GREY_COLOR,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  Container(
                    height: 8,
                    width: (48.w * 1) / 4,
                    decoration: BoxDecoration(
                      color: Styles.WHITE_COLOR,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Text(
                "3/4",
                style: AppTextStyles.w700
                    .copyWith(fontSize: 12, color: Styles.WHITE_COLOR),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => CustomNavigator.pop(),
              icon: Icon(Icons.close, color: Styles.WHITE_COLOR),
            )
          ]),
      body: Container(
        height: MediaQueryHelper.height,
        width: MediaQueryHelper.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.getAsset("task-background")),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: MediaQueryHelper.width,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(0xff282928).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select an answer",
                          style: AppTextStyles.w700.copyWith(
                            fontSize: 14,
                            color: Styles.WHITE_COLOR,
                          ),
                        ),
                        16.verticalSpace,
                        SvgPicture.asset(Constants.getSvg("rocket"), height: 40, width: 40),

                        12.verticalSpace,
                        Text(
                          "How would you rate the quality of service you received?",
                          style: AppTextStyles.w700.copyWith(
                            fontSize: 24,
                            color: Styles.WHITE_COLOR,
                          ),
                        ),
                        24.verticalSpace,
                        Container(
                          width: MediaQueryHelper.width,
                          padding: EdgeInsets.symmetric(vertical: 28),
                          decoration: BoxDecoration(
                            color: Styles.PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: 4,
                                itemSize: 24,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                ignoreGestures: false,
                                unratedColor: Colors.grey[300],
                                itemCount: 5,
                                itemPadding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return SvgPicture.asset(Constants.getSvg(selectedRate! > index ? "star-fill" : "star-outline"));
                                },
                                wrapAlignment: WrapAlignment.center,
                                onRatingUpdate: (rating) {
                                  selectedRate = rating;
                                  print(selectedRate);
                                },
                              ),
                              12.verticalSpace,
                              Text(
                                getRate(selectedRate),
                                style: AppTextStyles.w700.copyWith(
                                  fontSize: 24,
                                  color: Styles.WHITE_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            Spacer(),
            CustomButton(
              text: "Next",
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
            ),
          ],
        ),
      ),
    );
  }
}

getRate(rate) {
  switch(rate) {
    case 0:
      return "Very poor";
    case 1:
      return "Poor";
    case 2:
      return "Good";
    case 3:
      return "Very good";
    case 4:
      return "Excellent";
  }
}