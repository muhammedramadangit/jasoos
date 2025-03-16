import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/home/bloc/shops_bloc.dart';
import 'package:jasoos/features/home/models/shops_model.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_center_text.dart';
import '../../../main_widgets/custom_empty_view.dart';
import '../../../main_widgets/custom_loading.dart';
import '../widgets/discover_appbar.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final LatLng _initialPosition = LatLng(double.parse("${AppStorage.getUserLat}"), double.parse("${AppStorage.getUserLng}")); // Example: Cairo, Egypt
  Set<Marker> _markers = Set();
  Set<Circle> circles = Set();
  final customCircle = [];

  // late LatLng latLng;

  GoogleMapController? mapController;

  //current Location
  onMapCreated(GoogleMapController? controller) {
    mapController = controller;
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _initialPosition, zoom: 15),
    ));
    // _markers = widget.markers ?? Set();
  }

  Future<Uint8List> resizeAssetImage(String assetName, {required double width, required double height}) async {
    ByteData data = await rootBundle.load(assetName);
    final codec = await ui.instantiateImageCodec(Uint8List.sublistView(data.buffer.asUint8List()));
    final frameInfo = await codec.getNextFrame();
    final image = frameInfo.image;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromPoints(Offset(0, 0), Offset(width, height)));
    canvas.drawImageRect(
      image,
      Rect.fromPoints(Offset(0, 0), Offset(image.width.toDouble(), image.height.toDouble())),
      Rect.fromPoints(Offset(0, 0), Offset(width, height)),
      Paint(),
    );

    final resizedImage =
    await recorder.endRecording().toImage(width.toInt(), height.toInt());
    final resizedImageBytes =
    await resizedImage.toByteData(format: ui.ImageByteFormat.png);

    return resizedImageBytes!.buffer.asUint8List();
  }

  getImage({List<MarkerModel>? markers}) async {
    for (MarkerModel marker in markers!) {
      try {
        Uint8List resizedImage = await resizeAssetImage(
          "assets/images/marker.png",
          width: 48,
          height: 48,
        );
        _markers.add(
          Marker(
            markerId: MarkerId(marker.id.toString()),
            position: LatLng(
              double.tryParse(marker.lat.toString()) ?? double.parse("${AppStorage.getUserLat}"),
              double.tryParse(marker.lng.toString()) ?? double.parse("${AppStorage.getUserLng}"),
            ),
            icon: await BitmapDescriptor.bytes(resizedImage),
            // icon: BitmapDescriptor.defaultMarker,
          ),
        );

        print("MARKER TRUE $markers");

      } catch (error) {
        _markers.add(
          Marker(
            markerId: MarkerId(marker.id.toString()),
            position: LatLng(
              double.tryParse(marker.lat.toString()) ?? double.parse("${AppStorage.getUserLat}"),
              double.tryParse(marker.lng.toString()) ?? double.parse("${AppStorage.getUserLng}"),
            ),
            icon: await BitmapDescriptor.asset(
              ImageConfiguration(size: Size(48, 48)),
              "assets/images/marker.png",
            ),
            // icon: BitmapDescriptor.defaultMarker,
          ),
        );
        print("MARKER ERROR $markers");
      }
    }

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopsBloc, AppState>(
      builder: (context, state) {
        if(state is Loading) {
          return CustomLoading();
        } else if (state is Error) {
          return CustomCenterText(state.error ?? tr("errorException"));
        } else if (state is Empty) {
          return CustomEmptyView();
        } else {
          ShopsBloc bloc = ShopsBloc.instance;
          getImage(
            markers: ShopsBloc.instance.model.data!.map((ele) {
              return MarkerModel(id: ele.id, lat: double.parse("${ele.latitude}"), lng: double.parse("${ele.longitude}"));
            }).toList(),
          );
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
                      mapType: MapType.terrain,
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
                        height: 140.h,
                        child: ListView.separated(
                          itemCount: bloc.model.data!.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          separatorBuilder: (context, index) => 16.horizontalSpace,
                          itemBuilder: (context, index) {
                            ShopInfo? shop = bloc.model.data?[index];
                            return GestureDetector(
                              onTap: () {
                                CustomNavigator.push(Routes.SHOP_DETAILS, arguments: shop?.id);
                              },
                              child: Container(
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
                                        shop?.image ?? "",
                                        width: 90,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: 90,
                                            height: 80,
                                            color: Colors.grey[100],
                                            child: Center(
                                              child: Image.asset(
                                                Constants.getAsset("w-logo"),
                                                height: 46,
                                                width: 46,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    16.horizontalSpace,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            shop?.name ?? "",
                                            maxLines: 2,
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
                                                shop?.distance ?? "",
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
                                                "${shop?.tasksCount} mission",
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
    );
  }
}

class MarkerModel {
  int? id;
  double? lat;
  double? lng;

  MarkerModel({this.id, this.lat, this.lng});
}