import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);
  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Constants.getAsset("burger"),
    ];
    return CarouselSlider(
      items: images.map((element) {
        return _BannerItem(image: element);
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 0.9,
        autoPlay: true,
        height: 184.h,
        onPageChanged: (index, reason) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final String? image;
  const _BannerItem({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 184.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage("$image"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withValues(alpha: 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Styles.WHITE_COLOR.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Styles.GREEN_TEXT_COLOR,
                        child: Center(
                          child: SvgPicture.asset(Constants.getSvg("medal-star")),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Quality",
                        style: AppTextStyles.w700.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name of the Restaurant",
                          style: AppTextStyles.w500.copyWith(
                            color: Styles.WHITE_COLOR,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            SvgPicture.asset(Constants.getSvg("routing")),
                            SizedBox(width: 4.w),
                            Text(
                              "1 Mile",
                              style: AppTextStyles.w400.copyWith(
                                color: Styles.WHITE_COLOR,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(Constants.getSvg("medal-star")),
                            SizedBox(width: 4.w),
                            Text(
                              "4 Mission",
                              style: AppTextStyles.w400.copyWith(
                                color: Styles.WHITE_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Styles.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: Styles.RED_TEXT_COLOR.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "50% OFF",
                            style: AppTextStyles.w500.copyWith(
                              fontSize: 12,
                              color: Styles.RED_TEXT_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ),
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