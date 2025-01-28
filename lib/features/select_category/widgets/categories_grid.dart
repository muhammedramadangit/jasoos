import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  List<bool> isSelected = [];

  @override
  void initState() {
    for(int i = 0; i < 6; i++) {
      isSelected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            isSelected[index] = !isSelected[index];
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: isSelected[index] == true ? Styles.HIGHLIGHT_COLOR : Styles.FILL_COLOR,
              border: Border.all(color: isSelected[index] == true ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: isSelected[index] == true ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR),
                    shape: BoxShape.circle,
                    color: isSelected[index] == true
                        ? Styles.WHITE_COLOR
                        : null,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Constants.getSvg("pasta"),
                      colorFilter: ColorFilter.mode(
                        isSelected[index] == true
                            ? Styles.PRIMARY_COLOR
                            : Styles.BLACK_COLOR,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Pasta",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
