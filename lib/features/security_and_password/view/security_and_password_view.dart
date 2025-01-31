import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class SecurityAndPassword extends StatefulWidget {
  const SecurityAndPassword({super.key});

  @override
  State<SecurityAndPassword> createState() => _SecurityAndPasswordState();
}

class _SecurityAndPasswordState extends State<SecurityAndPassword> {
  bool? isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        "icon" : "user-info",
        "title" : "Two-step verification",
        "description" : "Detail your personal data",
        "can_switch" : false,
        "onTap" : () {
          CustomNavigator.push(Routes.TWO_STEP_VERIFICATION);
        },
      },
      {
        "icon" : "bank",
        "title" : "Change Password",
        "description" : "Settings for payment transactions",
        "can_switch" : false,
        "onTap" : () {
          CustomNavigator.push(Routes.CHANGE_PASSWORD);
        },
      },
      {
        "icon" : "bank",
        "title" : "Face ID",
        "description" : "Setup your face ID",
        "can_switch" : true,
        "onTap" : () {},
      },
    ];
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Security and Password"),
      body: Container(
        margin: Styles.SCREEN_PADDING,
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListView.separated(
          itemCount: tabs.length,
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => Styles.divider(ver: 12),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: tabs[index]["onTap"],
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                children: [
                  SvgPicture.asset(Constants.getSvg(tabs[index]["icon"])),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tabs[index]["title"],
                          style: AppTextStyles.w500.copyWith(fontSize: 14),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          tabs[index]["description"],
                          style: AppTextStyles.w400.copyWith(
                            fontSize: 12,
                            color: Styles.GREY_TEXT_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),

                  if(tabs[index]["can_switch"] == true)...[
                    CupertinoSwitch(
                      value: isActive!,
                      activeTrackColor: Styles.PRIMARY_COLOR,
                      onChanged: (value) {
                        setState(() => isActive = !isActive!);
                      },
                    ),
                  ]else...[
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Styles.DARK_GREY_COLOR,
                      size: 18,
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
