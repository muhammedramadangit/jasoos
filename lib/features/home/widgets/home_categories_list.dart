import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/home_categories_bloc.dart';
import 'package:jasoos/helper/media_quary_helper.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_loading.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoriesBloc, AppState>(
      builder: (context, state) {
        if(state is Loading) {
          return SizedBox(height: 100.h, width: MediaQueryHelper.width, child: CustomLoading());
        } else if (state is Error) {
          return CustomCenterText(state.error ?? tr("errorException"));
        } else if (state is Empty) {
          return SizedBox();
        } else {
          HomeCategoriesBloc bloc = HomeCategoriesBloc.instance;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  "Choose Tasks",
                  style: AppTextStyles.w500.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  itemCount: bloc.taskTypes!.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => 16.horizontalSpace,
                  itemBuilder: (context, index) {
                    int? typeId = bloc.taskTypes?[index].id;
                    return GestureDetector(
                      onTap: () => bloc.onChangeTaskType(typeId),
                      child: Container(
                        width: 80.w,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: bloc.selectedTaskType == typeId ? Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.3) : Colors.transparent,
                          border: Border.all(
                            width: 0.5,
                            color: bloc.selectedTaskType == typeId ? Styles.PRIMARY_COLOR : Colors.transparent,
                          ),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: Styles.BORDER_COLOR.withValues(alpha: 0.5),
                              child: Center(
                                child: SvgPicture.asset(Constants.getSvg("moneys")),
                              ),
                            ),
                            8.verticalSpace,
                            Text(
                              bloc.taskTypes?[index].name ?? "",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.w500.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
