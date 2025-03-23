import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/shop_details/bloc/shop_details_bloc.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_loading.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/url_launcher_helper.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../task_details/widgets/how_it_work_info.dart';
import '../widgets/shop_info_card.dart';
import '../widgets/shop_mission_list.dart';

class ShopDetailsView extends StatelessWidget {
  const ShopDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopDetailsBloc, AppState>(
      builder: (context, state) {
        ShopDetailsBloc bloc = ShopDetailsBloc.instance;
        return Scaffold(
          appBar: AppBars.titledAppBar(title: state is Done ? bloc.model.data?.name : ""),
          body: state is Loading ? CustomLoading() : state is Error ? CustomCenterText(state.error ?? tr("errorException")) : SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.w),
            child: Column(
              children: [
                ShopInfoCard(model: bloc.model.data),
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      howItWorkBottomSheet();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(Constants.getSvg("info-circle")),
                        8.horizontalSpace,
                        Expanded(
                          child: Text(
                            "How it Works",
                            style: AppTextStyles.w500.copyWith(fontSize: 14),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16,
                            color: Styles.DARK_GREY_COLOR),
                      ],
                    ),
                  ),
                ),
                Styles.divider(ver: 16.h, hor: 16.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      LauncherHelper.onLaunchUrl(Uri.parse(Constants.launchMap(bloc.model.data?.latitude, bloc.model.data?.longitude)));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Constants.getSvg("routing"),
                          height: 18,
                          width: 18,
                          colorFilter: ColorFilter.mode(
                              Styles.BLACK_COLOR, BlendMode.srcIn),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: Text(
                            "Navigate To Restaurant",
                            style: AppTextStyles.w500.copyWith(fontSize: 14),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16,
                            color: Styles.DARK_GREY_COLOR),
                      ],
                    ),
                  ),
                ),
                // 24.verticalSpace,
                Styles.divider(ver: 16.h, hor: 16.w),
                ShopMissionList(model: bloc.model.data),
              ],
            ),
          ),
        );
      },
    );
  }
}
