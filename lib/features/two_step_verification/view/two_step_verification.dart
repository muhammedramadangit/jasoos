import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  State<TwoStepVerification> createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  bool? isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Two-step verification"),
      body: Padding(
        padding: Styles.SCREEN_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Secure your account with two-step verification",
                      style: AppTextStyles.w500.copyWith(
                        fontSize: 16,
                        color: Styles.GREY_TEXT_COLOR,
                      ),
                    ),
                  ),
                  SizedBox(width: 50.w),
                  CupertinoSwitch(
                    value: isActive!,
                    activeTrackColor: Styles.PRIMARY_COLOR,
                    onChanged: (value) {
                      setState(() => isActive = !isActive!);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Styles.HIGHLIGHT_COLOR,
                  child: Center(
                    child: SvgPicture.asset(Constants.getSvg("lock"),
                      colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 14,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Styles.HIGHLIGHT_COLOR,
                  child: Center(
                    child: SvgPicture.asset(Constants.getSvg("lock"),
                      colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "Adding a phone number or using an authenticator will help keep your account safe from harm.",
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 14,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              text: "Save",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
