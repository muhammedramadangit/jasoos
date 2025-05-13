import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/profile/bloc/profile_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';

class CompleteBankAccount extends StatelessWidget {
  const CompleteBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, AppState>(
      builder: (context, state) {
        ProfileBloc bloc = ProfileBloc.instance;
        if(bloc.model.data?.bankAccount == null || (bloc.profileBankDataCount - bloc.profileBankNullCount != bloc.profileBankDataCount)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Text(
                tr("completeProfile"),
                style: AppTextStyles.w500.copyWith(fontSize: 14),
              ),
              14.verticalSpace,
              GestureDetector(
                onTap: () {
                  CustomNavigator.push(Routes.BANK_ACCOUNT);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Styles.WHITE_COLOR,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Styles.BORDER_COLOR),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14.r,
                        backgroundColor: Styles.HIGHLIGHT_COLOR,
                        child: SvgPicture.asset(
                          Constants.getSvg("bank"),
                          height: 16,
                          width: 16,
                          colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          tr("addYourBankAccount"),
                          style: AppTextStyles.w500.copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 6,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  color: Styles.BORDER_COLOR,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              if(bloc.profileBankDataCount != 0)
                              Container(
                                height: 6,
                                width: (48.w * (bloc.profileBankDataCount - bloc.profileBankNullCount)) / bloc.profileBankDataCount,
                                decoration: BoxDecoration(
                                  color: Styles.PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            "${bloc.profileBankDataCount - bloc.profileBankNullCount}/${bloc.profileBankDataCount}",
                            style: AppTextStyles.w700.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
