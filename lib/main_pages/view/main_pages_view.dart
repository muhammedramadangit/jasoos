import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/features/home/view/home_view.dart';
import 'package:jasoos/features/more/view/more_view.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/no_internet.dart';

import '../../features/discover_map/view/discover_view.dart';

Widget image(image) => Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
      child: SvgPicture.asset(
        image,
        height: 24.h,
        width: 24.h,
      ),
    );

class MainPagesView extends StatefulWidget {
  final int? index;

  const MainPagesView({Key? key, this.index}) : super(key: key);

  @override
  _MainPagesViewState createState() => _MainPagesViewState();
}

class _MainPagesViewState extends State<MainPagesView>
    with WidgetsBindingObserver {
  int currentIndex = 0;

  Widget taps(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return DiscoverView();
      case 2:
        return Container();
      case 3:
        return MoreView();
      default:
        return Container();
    }
  }

  @override
  void initState() {
    if (widget.index != null) {
      currentIndex = widget.index!;
    }
    checkConnectivity();
    super.initState();
  }

  Future<List<ConnectivityResult>> checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    log("CONNECTIVITY $result");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        return snapshot.data?.contains(ConnectivityResult.none) == true ? NoInternetView() : Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Styles.GREY_COLOR,
                  offset: Offset(5, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Styles.PRIMARY_COLOR,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Styles.GREY_COLOR,
              ),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Styles.PRIMARY_COLOR,
              unselectedItemColor: Styles.GREY_COLOR,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() => currentIndex = index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: image(Constants.getSvg("home")),
                  activeIcon: image(Constants.getSvg("home-fill")),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: image(Constants.getSvg("discover")),
                  activeIcon: image(Constants.getSvg("discover-fill")),
                  label: "Discover",
                ),
                BottomNavigationBarItem(
                  icon: image(Constants.getSvg("tasks")),
                  activeIcon: image(Constants.getSvg("tasks-fill")),
                  label: "My Tasks",
                ),
                BottomNavigationBarItem(
                  icon: image(Constants.getSvg("profile")),
                  activeIcon: image(Constants.getSvg("profile-fill")),
                  label: "Profile",
                ),
              ],
            ),
          ),
          body: taps(currentIndex),
        );
      },
    );
  }
}
