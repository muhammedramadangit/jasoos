import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/notifications/model/notifications_model.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

import '../../../helper/constants.dart';

class NotificationCard extends StatelessWidget {
  final NotificationsInfo? model;
  const NotificationCard({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Styles.BORDER_COLOR.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Styles.HIGHLIGHT_COLOR,
            child: Center(
              child: SvgPicture.asset(
                Constants.getSvg("bell"),
                height: 26,
                colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.title ?? "",
                  style: AppTextStyles.w500.copyWith(fontSize: 14),
                ),
                Text(
                  model?.body ?? "",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 12,
                    color: Styles.GREY_TEXT_COLOR,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
