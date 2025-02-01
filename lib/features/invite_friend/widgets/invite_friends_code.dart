import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';

class InviteFriendsCode extends StatelessWidget {
  const InviteFriendsCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Code",
                      style: AppTextStyles.w400.copyWith(
                        fontSize: 14,
                        color: Styles.DARK_GREY_COLOR,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "550-555-555",
                      style: AppTextStyles.w500.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              InkWell(
                onTap: () async {
                  String textToCopy = "550-555-555";
                  await Clipboard.setData(ClipboardData(text: textToCopy));
                  showToast("Copied to Clipboard : $textToCopy", color: Styles.DARK_GREY_COLOR);
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: SvgPicture.asset(Constants.getSvg("copy")),
              ),
            ],
          ),
        ),
        SizedBox(height: 36.h),
        CustomButton(
          text: "Share Code",
          onTap: () {},
        ),
      ],
    );
  }
}
