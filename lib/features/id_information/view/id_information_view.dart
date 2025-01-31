import 'package:flutter/material.dart';
import 'package:jasoos/features/id_information/widgets/id_information_form.dart';
import 'package:jasoos/features/id_information/widgets/id_information_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class IdInformationView extends StatelessWidget {
  const IdInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "ID information"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: Styles.SCREEN_PADDING,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  IdInformationForm(),
                ],
              ),
            ),
          ),
          IdInformationSubmit(),
        ],
      ),
    );
  }
}
