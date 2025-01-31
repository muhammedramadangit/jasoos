import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/features/bank_account/widgets/bank_account_form.dart';
import 'package:jasoos/features/bank_account/widgets/bank_account_submit.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class BankAccountView extends StatelessWidget {
  const BankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBars.titledAppBar(
              title: "Bank Account",
              actions: BankAccountBloc.instance.canEdit == true ? [] : [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: InkWell(
                    onTap: () {
                      BankAccountBloc.instance.changeEditStatus();
                    },
                    child: SvgPicture.asset(
                      Constants.getSvg("edit"),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ]
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: Styles.SCREEN_PADDING,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      BankAccountForm(),
                    ],
                  ),
                ),
              ),
              if(BankAccountBloc.instance.canEdit == true)
                BankAccountSubmit(),
            ],
          ),
        );
      },
    );
  }
}
