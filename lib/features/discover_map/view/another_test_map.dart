import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../helper/map_helper.dart';
import '../../../helper/styles.dart';

class DiscoverViewTest extends StatefulWidget {
  const DiscoverViewTest({Key? key, this.withRange = false, this.showConfirmBtn = true, this.lat, this.long}) : super(key: key);
  final bool withRange;
  final bool? showConfirmBtn;
  final double? lat;
  final double? long;

  @override
  State<DiscoverViewTest> createState() => _DiscoverViewTestState();
}

class _DiscoverViewTestState extends State<DiscoverViewTest> {
  GoogleMapController? _controller;
  Position? _currentLocation;
  double _range = 1000;
  late LatLng _targt;

  @override
  void initState() {
    getCurrentLocation();

    super.initState();
  }

  getCurrentLocation() async {
    _currentLocation = await MapHelper().getCurrentLocation();
    _targt = LatLng(widget.lat ?? (_currentLocation?.latitude ?? 31.0315084), widget.long ?? (_currentLocation?.longitude ?? 31.3905576));
    print(_currentLocation);
    setState(() {});
  }

  moveToCurrentLocation() {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 19.151926040649414, target: LatLng(_currentLocation!.latitude, _currentLocation!.longitude))));
  }

  String title = "Move to pick your location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        excludeHeaderSemantics: true,
        title: Text("Your Location", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(.5),
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.black),
          onPressed: () {
            CustomNavigator.pop();
          },
        ),
      ),
      backgroundColor: Styles.SCAFFOLD_COLOR,
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator(color: Styles.PRIMARY_COLOR))
          : Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  scrollGesturesEnabled: true,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  circles: widget.withRange
                      ? Set.of(
                    [
                      Circle(
                        circleId: CircleId("range"),
                        center: _targt,
                        radius: _range,
                        fillColor: Styles.PRIMARY_COLOR.withOpacity(.2),
                        strokeWidth: 0,
                      ),
                    ],
                  )
                      : const {},
                  onCameraIdle: () async {
                    title = await MapHelper.formatLatLng(latLng: _targt);
                    log(title);
                    setState(() {});
                  },
                  onMapCreated: (c) => _controller = c,
                  onCameraMove: (position) => _targt = position.target,
                  initialCameraPosition: CameraPosition(zoom: widget.withRange ? 12 : 19.151926040649414, target: _targt),
                ),
                Center(child: SvgPicture.asset(Constants.getSvg("star"))),
                if (widget.withRange)
                  Positioned(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                      margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("1 كم", style: TextStyle(fontSize: 12)),
                                Text("10 كم", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          Slider(
                            onChanged: (double value) {
                              setState(() {
                                _range = value;
                              });
                            },
                            label: (_range / 1000).round().toString() + " كم",
                            divisions: 10,
                            thumbColor: Styles.PRIMARY_COLOR,
                            activeColor: Colors.black,
                            value: _range,
                            min: 0,
                            max: 10000,
                          ),
                        ],
                      ),
                    ),
                    bottom: 210.h,
                    right: 0,
                    left: 0,
                  ),
                Positioned(
                  bottom: 60.h,
                  right: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          moveToCurrentLocation();
                        },
                        child: Icon(Icons.my_location, color: Colors.white),
                        backgroundColor: Styles.PRIMARY_COLOR,
                      ),
                      // SizedBox(height: 40.h),
                      // Container(
                      //   height: 86.h,
                      //   width: MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      //   padding: EdgeInsets.all(8),
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         SvgPicture.asset(Constants.getSvg("star-move")),
                      //         SizedBox(width: 16.w),
                      //         Expanded(
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(bottom: 4, top: 8),
                      //                 child: Text(
                      //                   "الموقع الحالي",
                      //                   style: TextStyle(fontSize: 12, color: Styles.PRIMARY_COLOR, fontWeight: FontWeight.w500),
                      //                 ),
                      //               ),
                      //               SizedBox(height: 4),
                      //               Expanded(
                      //                 child: Text(
                      //                   title, //"Dubai, Street 55 Dub Tower",
                      //                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 16.h),
                      // if (widget.showConfirmBtn!) ...[
                      //   CustomButton(
                      //     text: "confirm",
                      //     onTap: () {
                      //       CustomNavigator.pop(result: _targt);
                      //     },
                      //   ),
                      // ]
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}