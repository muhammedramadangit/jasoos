import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class EmptyNotificationsView extends StatelessWidget {
  const EmptyNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Constants.getSvg("notification_empty"), height: 150,),
          24.verticalSpace,
          Text(
            tr("noNotifications"),
            style: AppTextStyles.w500.copyWith(fontSize: 18),
          ),
          8.verticalSpace,
          Text(
            tr("notificationStayTuned"),
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
              color: Styles.GREY_TEXT_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
