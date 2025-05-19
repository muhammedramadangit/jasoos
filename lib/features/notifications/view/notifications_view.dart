import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/notifications/bloc/notifications_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';
import '../widgets/notification_card.dart';
import 'empty_notifications_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("notifications")),
      body: BlocBuilder<NotificationsBloc, AppState>(
        builder: (context, state) {
          log("STATUS $state");
          if(state is Loading) {
            return CustomLoading();
          } else if (state is Error) {
            return CustomCenterText(state.error ?? tr("errorException"));
          } else if (state is Empty) {
            return EmptyNotificationsView();
          } else {
            return ListView.separated(
              itemCount: NotificationsBloc.instance.model.data!.notifications!.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Styles.divider(),
              itemBuilder: (context, index) {
                return NotificationCard(
                  model: NotificationsBloc.instance.model.data?.notifications?[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
