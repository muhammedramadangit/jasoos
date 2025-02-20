import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

import '../../../helper/media_quary_helper.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../navigation/custom_navigation.dart';

showUploadImageBottomSheet() => showModalBottomSheet(
  isScrollControlled: true,
  isDismissible: true,
  enableDrag: true,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24.r),
      topRight: Radius.circular(24.r),
    ),
  ),
  backgroundColor: Styles.BACKGROUND_COLOR,
  context: CustomNavigator.navigatorState.currentContext!,
  builder: (context) => UploadImageBottomSheet(),
);

class UploadImageBottomSheet extends StatelessWidget {
  const UploadImageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.width,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Styles.BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
              ),
              child: Row(
                children: [
                  Text(
                    "Upload Images",
                    style: AppTextStyles.w700.copyWith(fontSize: 24, color: Styles.WHITE_COLOR),
                  ),
                  Spacer(),
                  InkWell(
                    radius: 10,
                    onTap: () => CustomNavigator.pop(),
                    child: Icon(Icons.clear, size: 20, color: Styles.WHITE_COLOR),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQueryHelper.width,
              height: 250.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Styles.LIGHT_GREY_BORDER.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage("https://s3-alpha-sig.figma.com/img/f6c7/0a58/8fa88d7db8bcd35dc4175ac5f9aa6591?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YMS4FRRnM9dnFsTjCQstZ5I48YW6KwSBm6oysMdnJDka2JZgkWhb81Ncwrx5Ohsj~LTpai9-lNtXCtSny2oB6m64HGyfTl1rNBMbhKUSKHrGjOiNrIXlh2Z0efMZy9LDN6qYiiR7rNzHA2RGUAbbEcA1K584U4n2k-bsHbs~CwilMnOA9~YGqHSHKr29JpA4Q-vUeSyPKQnpUWHJjxVUn4zDIrf-Pr5J3qDYFqbADBesQ4JAjUkfPkJzbfGNeW9m22pyV~zo-bBD8QXkitJeQmk1hDzaE4HXkHTUuUOskXQLnOb3qDH5EIOLvGrXfK6BeE7dUNjSmqy3XphbVrowBA__"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            24.verticalSpace,
            CustomButton(
              text: "Take Photo",
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              onTap: () {},
            ),
            16.verticalSpace,
            CustomButton(
              text: "Choose from Library",
              txtColor: Styles.PRIMARY_COLOR,
              color: Styles.HIGHLIGHT_COLOR,
              borderColor: Styles.HIGHLIGHT_COLOR,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              onTap: () {},
            ),
            16.verticalSpace,
            CustomButton(
              text: "Take Photo",
              txtColor: Styles.WHITE_COLOR,
              color: Colors.transparent,
              borderColor: Styles.WHITE_COLOR,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              onTap: () {},
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}