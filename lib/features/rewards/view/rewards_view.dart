import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_empty_view.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/rewards_bloc.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("rewards")),
      body: SizedBox.expand(
        child: BlocBuilder<RewardsBloc, AppState>(
          builder: (context, state) {
            if(state is Loading) {
              return CustomLoading();
            } else if (state is Error) {
              return CustomCenterText(state.error ?? tr("errorException"));
            } else if (state is Empty) {
              return CustomEmptyView();
            } else {
              RewardsBloc bloc = RewardsBloc.instance;
              return ListView.separated(
                itemCount: bloc.model.data!.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                separatorBuilder: (context, index) => Styles.divider(ver: 12.h),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.5),
                        child: Center(
                          child: SvgPicture.asset(Constants.getSvg("cash-in")),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bloc.model.data?[index].rewardName ?? "",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                            // Text(
                            //   "12:49 pm",
                            //   style: AppTextStyles.w400.copyWith(
                            //     fontSize: 12,
                            //     color: Styles.GREY_TEXT_COLOR,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            bloc.model.data?[index].rewardValue ?? "",
                            style: AppTextStyles.w500.copyWith(
                              fontSize: 16,
                              color: Styles.GREEN_TEXT_COLOR,
                            ),
                          ),
                          4.horizontalSpace,
                          SvgPicture.asset(
                            Constants.getSvg("riyal"),
                            colorFilter: ColorFilter.mode(Styles.GREEN_TEXT_COLOR, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }
          }
        ),
      ),
    );
  }
}
