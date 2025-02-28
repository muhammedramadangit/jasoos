import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/home_categories_bloc.dart';

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
          return CustomLoading();
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
                  "Choose categories",
                  style: AppTextStyles.w500.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 90.h,
                child: ListView.separated(
                  itemCount: bloc.model.data!.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => 16.horizontalSpace,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60.w,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Styles.BORDER_COLOR.withValues(
                                alpha: 0.5),
                            child: Center(
                              child: SvgPicture.asset(Constants.getSvg("moneys")),
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            bloc.model.data?[index].name ?? "",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.w500.copyWith(fontSize: 10),
                          ),
                        ],
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
