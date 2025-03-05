import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/my_tasks/widgets/task_card.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/text_styles.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../bloc/completed_tasks_bloc.dart';

class CompletedTasksList extends StatelessWidget {
  const CompletedTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryHelper.width,
      child: BlocBuilder<CompletedTasksBloc, AppState>(
        builder: (context, state) {
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else if (state is Empty) {
            return SizedBox();
          } else {
            CompletedTasksBloc bloc = CompletedTasksBloc.instance;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Completed Tasks",
                    style: AppTextStyles.w500.copyWith(fontSize: 18),
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  height: 210.h,
                  child: ListView.separated(
                    itemCount: bloc.model.data!.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) => 12.horizontalSpace,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        model: bloc.model.data?[index],
                        isComplete: true,
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
