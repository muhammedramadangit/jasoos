import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/home/widgets/complete_profile.dart';
import 'package:jasoos/features/home/widgets/home_appbar.dart';
import 'package:jasoos/features/home/widgets/home_slider.dart';
import 'package:jasoos/helper/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Hi, Muhamad👋",
                style: AppTextStyles.w500.copyWith(fontSize: 24),
              ),
            ),
            CompleteProfile(),
            HomeSlider(),
          ],
        ),
      ),
    );
  }
}
