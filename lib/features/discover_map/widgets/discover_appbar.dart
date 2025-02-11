import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

AppBar discoverAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Styles.SCAFFOLD_COLOR,
    toolbarHeight: 80.h,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: SizedBox(
        width: MediaQueryHelper.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Styles.WHITE_COLOR,
                child: Center(
                  child: SvgPicture.asset(Constants.getSvg("logo")),
                ),
              ),

              DiscoverCategoryList(),
            ],
          ),
        ),
      ),
    ),
  );
}

class DiscoverCategoryList extends StatefulWidget {
  const DiscoverCategoryList({super.key});

  @override
  State<DiscoverCategoryList> createState() => _DiscoverCategoryListState();
}

class _DiscoverCategoryListState extends State<DiscoverCategoryList> {
  int? selected;

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: selected == index ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Constants.getSvg("cup"),
                    colorFilter: ColorFilter.mode(selected == index ? Styles.WHITE_COLOR : Styles.PRIMARY_COLOR , BlendMode.srcIn),
                  ),
                  10.horizontalSpace,
                  Text(
                    "Burgur",
                    style: AppTextStyles.w500.copyWith(
                      fontSize: 12,
                      color: selected == index ? Styles.WHITE_COLOR : Styles.PRIMARY_COLOR,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

