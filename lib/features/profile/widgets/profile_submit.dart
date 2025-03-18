import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../bloc/profile_bloc.dart';

class ProfileSubmit extends StatelessWidget {
  const ProfileSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, AppState>(
      builder: (context, state) {
        return CustomButton(
          text: "Save",
          loading: state is Loading,
          onTap: () {
            ProfileBloc.instance.add(Click());
          },
        );
      },
    );
  }
}
