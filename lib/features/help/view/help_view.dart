import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/help/bloc/help_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_expandable_widget.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Help Center"),
      body: BlocBuilder<HelpBloc, AppState>(
        builder: (context, state) {
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else if (state is Empty) {
            return CustomEmptyView();
          } else {
            HelpBloc bloc = HelpBloc.instance;
            return ListView.separated(
              itemCount: bloc.model.data!.faqs!.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return CustomExpandableWidget(
                  title: Text(
                    bloc.model.data?.faqs?[index].question ?? "",
                    style: AppTextStyles.w500.copyWith(fontSize: 16),
                  ),
                  child: Text(
                    bloc.model.data?.faqs?[index].answer ?? "",
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 14,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
