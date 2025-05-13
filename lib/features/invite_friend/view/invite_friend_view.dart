import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/invite_friend/widgets/invite_friends_code.dart';
import 'package:jasoos/features/invite_friend/widgets/invite_friends_tips.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/invitation_code_bloc.dart';

class InviteFriendView extends StatelessWidget {
  const InviteFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("inviteFriends")),
      body: BlocBuilder<InvitationCodeBloc, AppState>(
        builder: (context, state) {
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else {
            return Padding(
              padding: Styles.SCREEN_PADDING,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  InviteFriendsTips(),
                  SizedBox(height: 80.h),
                  InviteFriendsCode(code: InvitationCodeBloc.instance.model.data?.invitationCode),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
