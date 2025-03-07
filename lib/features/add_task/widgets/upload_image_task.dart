import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/features/add_task/widgets/custom_task_card.dart';
import 'package:jasoos/features/add_task/widgets/upload_bottom_sheet.dart';

import '../../../helper/constants.dart';
import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../models/questions_model.dart';

class UploadImageTask extends StatelessWidget {
  final QuestionInfo? model;
  const UploadImageTask({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return CustomTaskCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upload an image",
            style: AppTextStyles.w700.copyWith(
              fontSize: 14,
              color: Styles.WHITE_COLOR,
            ),
          ),
          16.verticalSpace,
          SvgPicture.asset(Constants.getSvg("rocket"), height: 40, width: 40),
          12.verticalSpace,
          Text(
            model?.question ?? "",
            style: AppTextStyles.w700.copyWith(
              fontSize: 24,
              color: Styles.WHITE_COLOR,
            ),
          ),
          24.verticalSpace,
          GestureDetector(
            onTap: () {
              showUploadImageBottomSheet();
            },
            child: Container(
              height: 114.h,
              width: MediaQueryHelper.width,
              padding: EdgeInsets.symmetric(vertical: 28),
              decoration: BoxDecoration(
                color: Styles.PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(12.r),
                image: StartTaskBloc.instance.imageAnswer == null ? null : DecorationImage(
                  image: FileImage(File(StartTaskBloc.instance.imageAnswer!.path)),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(Constants.getSvg("camera")),
              ),
            ),
          ),
          // 24.verticalSpace,
          // SizedBox(
          //   height: 80.h,
          //   child: ListView.separated(
          //     itemCount: 5,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     separatorBuilder: (context, index) => SizedBox(width: 8.w),
          //     itemBuilder: (context, index) {
          //       return Container(
          //         width: 70.w,
          //         decoration: BoxDecoration(
          //           color: Styles.LIGHT_GREY_BORDER.withValues(alpha: 0.1),
          //           borderRadius: BorderRadius.circular(8.r),
          //           image: DecorationImage(
          //             image: NetworkImage("https://s3-alpha-sig.figma.com/img/f6c7/0a58/8fa88d7db8bcd35dc4175ac5f9aa6591?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YMS4FRRnM9dnFsTjCQstZ5I48YW6KwSBm6oysMdnJDka2JZgkWhb81Ncwrx5Ohsj~LTpai9-lNtXCtSny2oB6m64HGyfTl1rNBMbhKUSKHrGjOiNrIXlh2Z0efMZy9LDN6qYiiR7rNzHA2RGUAbbEcA1K584U4n2k-bsHbs~CwilMnOA9~YGqHSHKr29JpA4Q-vUeSyPKQnpUWHJjxVUn4zDIrf-Pr5J3qDYFqbADBesQ4JAjUkfPkJzbfGNeW9m22pyV~zo-bBD8QXkitJeQmk1hDzaE4HXkHTUuUOskXQLnOb3qDH5EIOLvGrXfK6BeE7dUNjSmqy3XphbVrowBA__"),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(3),
          //               child: CircleAvatar(
          //                 radius: 8,
          //                 backgroundColor: Styles.WHITE_COLOR,
          //                 child: Center(
          //                   child: Icon(
          //                     CupertinoIcons.delete,
          //                     color: Styles.RED_COLOR,
          //                     size: 8,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
