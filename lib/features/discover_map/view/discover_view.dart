import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../helper/constants.dart';
import '../../../helper/text_styles.dart';
import '../widgets/discover_appbar.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = const LatLng(30.033333, 31.233334); // Example: Cairo, Egypt
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('restaurant'),
          position: LatLng(30.033920, 31.233402), // Example: Restaurant Location
          infoWindow: InfoWindow(title: "Al Baik Restaurant"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: discoverAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            // Google Map
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r),
              ),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 14.0,
                ),
                markers: _markers,
                mapToolbarEnabled: true,
                zoomControlsEnabled: false,
              ),
            ),

            // Search Bar
            Positioned(
              top: 16,
              left: 12,
              right: 12,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(offset:Offset(0, 4), color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, spreadRadius: 0),
                    BoxShadow(offset:Offset(0, 0), color: Colors.black.withValues(alpha: 0.04), blurRadius: 1, spreadRadius: 0),
                  ],
                ),
                child: TextInputField(
                  hintText: "search",
                  withBottomPadding: false,
                  borderColor: Styles.SCAFFOLD_COLOR,
                  prefixIcon: SvgPicture.asset(Constants.getSvg("location-fill")),
                  suffixIcon: Icon(Icons.clear, color: Colors.grey),
                ),
              ),
            ),

            // Bottom Restaurant Card
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 125.h,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) => 16.horizontalSpace,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300.w,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(offset:Offset(0, 4), color: Colors.black.withValues(alpha: 0.1), blurRadius: 16, spreadRadius: -8),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              "https://images.pexels.com/photos/18294662/pexels-photo-18294662/free-photo-of-restaurant-and-street-with-cars-at-night.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              width: 90,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          16.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Al Baik Restaurant",
                                  style: AppTextStyles.w700.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                8.verticalSpace,
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Constants.getSvg("routing"),
                                      colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "1 Mile",
                                      style: AppTextStyles.w500.copyWith(
                                        color: Styles.DARK_TEXT_COLOR,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      Constants.getSvg("discount-round"),
                                      colorFilter: ColorFilter.mode(Styles.DARK_TEXT_COLOR, BlendMode.srcIn),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "valid till tuesday",
                                      style: AppTextStyles.w500.copyWith(
                                        color: Styles.DARK_TEXT_COLOR,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                                Text(
                                  "View Details",
                                  style: AppTextStyles.w400.copyWith(
                                    color: Styles.GREY_TEXT_COLOR,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}