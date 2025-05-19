import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/more/widgets/delete_account_dialog.dart';
import 'package:jasoos/features/more/widgets/general_tabs.dart';
import 'package:jasoos/features/more/widgets/other_tabs.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../../../main_widgets/dialogs/custom_show_dialog.dart';
import '../widgets/complete_bank_account.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/user_profile_card.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("profile"), back: false),
      body: SingleChildScrollView(
        padding: Styles.SCREEN_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileCard(),
            CompleteBankAccount(),
            24.verticalSpace,
            GeneralTabs(),
            SizedBox(height: 10.h),
            OtherTabs(),
            InkWell(
              onTap: () {
                showCustomDialog(dialog: LogoutDialog(), dismiss: true);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    SvgPicture.asset(Constants.getSvg("logout")),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr("signOut"),
                            style: AppTextStyles.w500.copyWith(
                              fontSize: 14,
                              color: Styles.RED_TEXT_COLOR,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            tr("logoutFromYourAccount"),
                            style: AppTextStyles.w400.copyWith(
                              fontSize: 12,
                              color: Styles.GREY_TEXT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Styles.DARK_GREY_COLOR,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            CustomButton(
              text: tr("deleteAccount"),
              color: Styles.RED_COLOR,
              borderColor: Styles.RED_COLOR,
              onTap: () {
                showCustomDialog(dialog: DeleteAccountDialog(), dismiss: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
