import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/language/bloc/language_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_radio.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Language"),
      body: BlocBuilder<LanguageBloc, AppState>(
        builder: (context, state) {
          LanguageBloc bloc = LanguageBloc.instance;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: bloc.languages.length,
                  padding: Styles.SCREEN_PADDING,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => Styles.divider(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              Constants.getSvg(bloc.languages[index]["icon"])),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              bloc.languages[index]["title"],
                              style: AppTextStyles.w500.copyWith(fontSize: 16),
                            ),
                          ),
                          CustomRadio(
                            value: bloc.selectedLangCode,
                            groupValue: index,
                            onChanged: (value) {
                              bloc.selectedLangCode = index;
                              bloc.currentLangCode = bloc.languages[index]["language"];
                              bloc.add(Update());
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                text: "Save",
                padding: Styles.SCREEN_PADDING,
                onTap: () async {
                  await bloc.changeLocaleLang();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
