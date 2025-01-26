import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _controller = PageController();
  int pageValue = 0;

  // @override
  // void initState() {
  //   _controller = PageController(initialPage: pageValue);
  //   // _controller = PageController();
  //   super.initState();
  // }

  List<Map<String, dynamic>> data = [
    {
      "image" : "assets/images/v1.png",
      "title" : "Find a your fav spot, and start rating your items from now",
      "description" : "Explore over 25,924 available job roles and upgrade your operator now.",
    },
    {
      "image" : "assets/images/v2.png",
      "title" : "Get Ready and submit your Review always dreamed of",
      "description" : "The better the skills you have, the greater the good job opportunities for you.",
    },
    {
      "image" : "assets/images/v3.png",
      "title" : "Hundreds of jobs are waiting for you to join together",
      "description" : "Immediately join us and start applying for the job you are interested in.",
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: data.length,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        pageValue = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_controller.position.haveDimensions) {
                            value = _controller.page! - index;
                            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                          }
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: value,
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(data[index]["image"]),
                          ],
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Constants.getSvg("logo"),
                            height: 32.h,
                            width: 32.h,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              CustomNavigator.push(Routes.LOGIN, clean: true);
                              // _controller.jumpToPage(data.length - 1);
                              // _controller.previousPage(
                              //   duration: Duration(milliseconds: 300),
                              //   curve: Curves.easeInOut,
                              // );
                            },
                            child: Text(
                              "Skip",
                              style: AppTextStyles.w400.copyWith(
                                fontSize: 14,
                                color: Styles.GREY_TEXT_COLOR,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 220.h,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[pageValue]["title"],
                    style: AppTextStyles.w500.copyWith(fontSize: 30),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    data[pageValue]["description"],
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 16,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(3, (current) {
                return Container(
                  height: current == pageValue ? 8 : 6,
                  width: current == pageValue ? 8 : 6,
                  margin: EdgeInsets.symmetric(horizontal: 1.5),
                  decoration: BoxDecoration(
                    color: current == pageValue ? Styles.PRIMARY_COLOR : Styles.HIGHLIGHT_COLOR,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),

            CustomButton(
              text: pageValue == 2 ? "Get Started" : "Next",
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              onTap: () {
                if (pageValue < data.length - 1) {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  CustomNavigator.push(Routes.LOGIN, clean: true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}