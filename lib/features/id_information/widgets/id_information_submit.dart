import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../bloc/id_information_bloc.dart';

class IdInformationSubmit extends StatelessWidget {
  const IdInformationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdInformationBloc, AppState>(
      builder: (context, state) {
        return CustomButton(
          text: tr("save"),
          loading: state is Loading,
          padding: Styles.SCREEN_PADDING,
          onTap: () {
            IdInformationBloc.instance.add(Click());
          },
        );
      },
    );
  }
}
