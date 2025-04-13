import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/profile/bloc/profile_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, AppState>(
      builder: (context, state) {
        ProfileBloc bloc = ProfileBloc.instance;
        return GestureDetector(
          onTap: () {
            CustomNavigator.push(Routes.PROFILE);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: Styles.WHITE_COLOR,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Styles.BORDER_COLOR),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr("completeProfile"),
                        style: AppTextStyles.w500.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        tr("addYourDetailsToUnlockFullExperience"),
                        style: AppTextStyles.w400.copyWith(fontSize: 10),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 10,
                                width: 240.w,
                                decoration: BoxDecoration(
                                  color: Styles.BORDER_COLOR,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              Container(
                                height: 10,
                                width: (240.w * (bloc.profileDataCount - bloc.profileNullCount)) / bloc.profileDataCount,
                                decoration: BoxDecoration(
                                  color: Styles.PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            "${bloc.profileDataCount - bloc.profileNullCount}/${bloc.profileDataCount}",
                            style: AppTextStyles.w700.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.arrow_forward_ios, size: 16,),
              ],
            ),
          ),
        );
      },
    );
  }
}
