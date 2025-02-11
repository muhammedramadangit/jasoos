import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/select_category/bloc/select_category_bloc.dart';
import 'package:jasoos/features/select_category/widgets/categories_grid.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_center_text.dart';
import 'package:jasoos/main_widgets/custom_empty_view.dart';
import 'package:jasoos/main_widgets/custom_loading.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SelectCategoryBloc, AppState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Text(
                  "What type of category are you interested in?",
                  style: AppTextStyles.w500.copyWith(fontSize: 28),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Tell us what you’re interested in so we can customise the app for your needs.",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 16,
                    color: Styles.GREY_TEXT_COLOR,
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: state is Loading
                      ? CustomLoading()
                      : state is Error
                      ? CustomCenterText(state.error ?? tr("errorException"))
                      : state is Empty
                      ? SizedBox(width: MediaQueryHelper.width, child: CustomEmptyView())
                      : CategoriesGrid(),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: state is Empty ? "Skip" : "Next",
                  loading: state is LoadingBTN,
                  onTap: () {
                    if(state is Empty) {
                      CustomNavigator.push(Routes.LOGIN, clean: true);
                    } else {
                      SelectCategoryBloc.instance.add(Click());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
