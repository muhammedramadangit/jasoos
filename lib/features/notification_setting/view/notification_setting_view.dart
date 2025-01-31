import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_titled_switch.dart';

class NotificationSettingView extends StatelessWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        "title" : "Special tips and offers",
        "mobile_status" : false,
        "email_status" : true,
      },
      {
        "title" : "Activity",
        "mobile_status" : false,
        "email_status" : true,
      },
      {
        "title" : "Reminders",
        "mobile_status" : false,
        "email_status" : true,
      },
    ];
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Notifications"),
      body: Container(
        padding: EdgeInsets.all(24),
        margin: Styles.SCREEN_PADDING,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
        ),
        child: ListView.separated(
          itemCount: tabs.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          separatorBuilder: (context, index) => Styles.divider(ver: 20.h),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tabs[index]["title"],
                  style: AppTextStyles.w500.copyWith(fontSize: 18),
                ),
                SizedBox(height: 24.h),

                CustomTitledSwitch(
                  label: "Push Notification",
                  isActive: tabs[index]["mobile_status"],
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                ),

                SizedBox(height: 24.h),

                CustomTitledSwitch(
                  label: "Email",
                  isActive: tabs[index]["email_status"],
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
