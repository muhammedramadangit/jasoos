import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/invite_friend/widgets/invite_friends_code.dart';
import 'package:jasoos/features/invite_friend/widgets/invite_friends_tips.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class InviteFriendView extends StatelessWidget {
  const InviteFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Invite Friends"),
      body: Padding(
        padding: Styles.SCREEN_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20 .h),
            InviteFriendsTips(),
            SizedBox(height: 80.h),
            InviteFriendsCode(),
          ],
        ),
      ),
    );
  }
}
