import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/task_details/bloc/shop_details_bloc.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_loading.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../widgets/how_it_work_info.dart';
import '../widgets/task_info_card.dart';
import '../widgets/task_mission_list.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

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
                TaskInfoCard(model: bloc.model.data),
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
                Styles.divider(ver: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () {},
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

                24.verticalSpace,
                TaskMissionList(model: bloc.model.data),
                16.verticalSpace,
                CustomButton(
                  onTap: () {
                    if(bloc.distance <= 100) {
                      CustomNavigator.push(Routes.START_TASK);
                    } else {
                      showCustomDialog(dialog: CustomAlertDialog("You cannot start the task unless you are at the designated location."));
                    }
                  },
                  text: "Start Task",
                  textStyle: AppTextStyles.w500.copyWith(
                    fontSize: 16,
                    color: bloc.distance <= 100 ? Styles.WHITE_COLOR : Styles.GREY_TEXT_COLOR,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  color: bloc.distance <= 100 ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR,
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
