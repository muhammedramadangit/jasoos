import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/profile/widgets/profile_form.dart';
import 'package:jasoos/features/profile/widgets/profile_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Account Details"),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: Styles.SCREEN_PADDING,
        child: Column(
          children: [
            ProfileForm(),
            SizedBox(height: 16.h),
            ProfileSubmit(),
          ],
        ),
      ),
    );
  }
}
