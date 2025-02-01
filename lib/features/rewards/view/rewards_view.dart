import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/rewards/widgets/rewards_balance.dart';
import 'package:jasoos/features/rewards/widgets/rewards_history.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Rewards"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
        child: Column(
          children: [
            RewardsBalance(),
            SizedBox(height: 34.h),
            RewardsHistory(),
          ],
        ),
      ),
    );
  }
}
