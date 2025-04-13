import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/policy/bloc/policy_bloc.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../../../core/app_state.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("privacyPolicy")),
      body: BlocBuilder<PolicyBloc, AppState>(
        builder: (context, state) {
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else if (state is Empty) {
            return CustomEmptyView();
          } else {
            PolicyBloc bloc = PolicyBloc.instance;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              physics: ClampingScrollPhysics(),
              child: Text(
                bloc.model.data?.privacy ?? "",
                style: AppTextStyles.w400.copyWith(fontSize: 14),
              ),
            );
          }
        },
      ),
    );
  }
}
