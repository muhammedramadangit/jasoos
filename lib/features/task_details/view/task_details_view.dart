import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_loading.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/url_launcher_helper.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../add_task/bloc/start_task_bloc.dart';
import '../bloc/task_details_bloc.dart';
import '../widgets/how_it_work_info.dart';
import '../widgets/task_info_card.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsBloc, AppState>(
      builder: (context, state) {
        TaskDetailsBloc bloc = TaskDetailsBloc.instance;
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


                // TaskMissionList(model: bloc.model.data),
                // 16.verticalSpace,

                56.verticalSpace,

                if(bloc.model.data?.status == 0 || bloc.model.data?.status == 1)
                BlocBuilder<StartTaskBloc, AppState>(
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        StartTaskBloc.instance.add(Start(arguments: bloc.model.data?.id));
                        // QuestionsBloc.instance.add(Get(arguments: bloc.model.data?.id));
                        // CustomNavigator.push(Routes.START_TASK);
                        // if(bloc.distance <= 100) {
                        //   AddTaskBloc.instance.add(Start(arguments: bloc.model.data?.id));
                        // } else {
                        //   showCustomDialog(dialog: CustomAlertDialog("You cannot start the task unless you are at the designated location."));
                        // }
                      },
                      text: bloc.model.data?.status == 1 ? "Complete Task" : "Start Task",
                      loading: state is Loading,
                      textStyle: AppTextStyles.w500.copyWith(
                        fontSize: 16,
                        // color: bloc.distance <= 100 ? Styles.WHITE_COLOR : Styles.GREY_TEXT_COLOR,
                        color: Styles.WHITE_COLOR,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      // color: bloc.distance <= 100 ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR,
                      color: Styles.PRIMARY_COLOR,
                    );
                  }
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
