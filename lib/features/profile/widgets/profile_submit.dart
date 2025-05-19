import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../bloc/profile_bloc.dart';

class ProfileSubmit extends StatelessWidget {
  const ProfileSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, AppState>(
      builder: (context, state) {
        ProfileBloc bloc = ProfileBloc.instance;
        return CustomButton(
          text: tr("save"),
          loading: state is Loading,
          color: (bloc.birthday != null || bloc.gender?.value != "null" || bloc.maritalStatus?.value != "null") ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR,
          onTap: () {
            if(bloc.birthday != null || bloc.gender?.value != "null" || bloc.maritalStatus?.value != "null")
              bloc.add(Click());
          },
        );
      },
    );
  }
}
