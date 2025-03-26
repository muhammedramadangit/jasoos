import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_event.dart';
import '../../../core/app_state.dart';
import '../../../core/app_storage.dart';
import '../../../helper/constants.dart';
import '../../../helper/image_picker_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../profile/bloc/profile_bloc.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlocBuilder<ProfileBloc, AppState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  ImagePickerHelper.showOption(
                    onGet: (value) {
                      ProfileBloc.instance.profileImage = value;
                      ProfileBloc.instance.add(PickImage());
                    },
                  );
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: Styles.HIGHLIGHT_COLOR,
                      backgroundImage: ProfileBloc.instance.profileImage != null
                          ? FileImage(ProfileBloc.instance.profileImage!)
                          : NetworkImage(AppStorage.getUser?.data?.profileImage ?? ""),
                    ),
                    Positioned.directional(
                      bottom: 0,
                      start: 0,
                      textDirection: TextDirection.rtl,
                      child: SvgPicture.asset(Constants.getSvg("edit-fill")),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 8.h),
          Text(
            AppStorage.getUser?.data?.name ?? "",
            style: AppTextStyles.w500.copyWith(fontSize: 14),
          ),
          SizedBox(height: 6.h),
          Text(
            AppStorage.getUser?.data?.email ?? "",
            style: AppTextStyles.w400.copyWith(
              fontSize: 12,
              color: Styles.GREY_TEXT_COLOR,
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Next Task Awaits!",
                  style: AppTextStyles.w500.copyWith(fontSize: 12),
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ==== LEVEL ====
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Level",
                          style: AppTextStyles.w400.copyWith(
                            fontSize: 12,
                            color: Styles.GREY_TEXT_COLOR,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(Constants.getSvg("crown")),
                            4.horizontalSpace,
                            Text(
                              AppStorage.getUser?.data?.level ?? "-",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ==== Tasks ====
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tasks",
                          style: AppTextStyles.w400.copyWith(
                            fontSize: 12,
                            color: Styles.GREY_TEXT_COLOR,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(Constants.getSvg("medal-star"), colorFilter: ColorFilter.mode(Styles.BLACK_COLOR, BlendMode.srcIn)),
                            4.horizontalSpace,
                            Text(
                              AppStorage.getUser?.data?.completedTasks ?? "0",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ==== Tasks ====
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rank",
                          style: AppTextStyles.w400.copyWith(
                            fontSize: 12,
                            color: Styles.GREY_TEXT_COLOR,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          children: [
                            SvgPicture.asset(Constants.getSvg("star-move"), colorFilter: ColorFilter.mode(Styles.BLACK_COLOR, BlendMode.srcIn)),
                            4.horizontalSpace,
                            Text(
                              AppStorage.getUser?.data?.completedTasks ?? "0",
                              style: AppTextStyles.w500.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
