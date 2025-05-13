import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsCode extends StatelessWidget {
  final String? code;
  const InviteFriendsCode({super.key, this.code});

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
                      tr("code"),
                      style: AppTextStyles.w400.copyWith(
                        fontSize: 14,
                        color: Styles.DARK_GREY_COLOR,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      code ?? "",
                      style: AppTextStyles.w500.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              InkWell(
                onTap: () async {
                  String textToCopy = code ?? "";
                  await Clipboard.setData(ClipboardData(text: textToCopy));
                  showToast("${tr("copiedToClipboard")} : $textToCopy", color: Styles.DARK_GREY_COLOR);
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
          text: tr('shareCode'),
          onTap: () {
            ShareParams(
              text: code ?? "",
              title: tr("referralFriend"),
            );
          },
        ),
      ],
    );
  }
}
