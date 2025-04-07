import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/widgets/custom_task_card.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/start_task_bloc.dart';
import '../models/questions_model.dart';

class ReviewTask extends StatelessWidget {
  final QuestionInfo? model;
  const ReviewTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartTaskBloc, AppState>(
      builder: (context, state) {
        StartTaskBloc bloc = StartTaskBloc.instance;
        return CustomTaskCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select an answer",
                style: AppTextStyles.w700.copyWith(
                  fontSize: 14,
                  color: Styles.WHITE_COLOR,
                ),
              ),
              16.verticalSpace,
              SvgPicture.asset(Constants.getSvg("rocket"),
                  height: 40, width: 40),
              12.verticalSpace,
              Text(
                model?.question ?? "",
                style: AppTextStyles.w700.copyWith(
                  fontSize: 24,
                  color: Styles.WHITE_COLOR,
                ),
              ),
              24.verticalSpace,
              Container(
                width: MediaQueryHelper.width,
                padding: EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: Styles.BLUE_COLOR,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: bloc.selectedRate!,
                      itemSize: 24,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      ignoreGestures: false,
                      unratedColor: Colors.grey[300],
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return SvgPicture.asset(
                          Constants.getSvg(
                            bloc.selectedRate! > index
                                ? "star-fill"
                                : "star-outline",
                          ),
                        );
                      },
                      wrapAlignment: WrapAlignment.center,
                      onRatingUpdate: (rating) {
                        bloc.selectedRate = rating;
                        bloc.getRate();
                        bloc.add(Update());
                      },
                    ),
                    12.verticalSpace,
                    Text(
                      bloc.selectedReview ?? "-",
                      style: AppTextStyles.w500.copyWith(
                        fontSize: 16,
                        color: Styles.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
