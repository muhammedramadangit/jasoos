import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/shops_bloc.dart';
import 'package:jasoos/features/home/models/shops_model.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/map_helper.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final TextEditingController _searchController = TextEditingController();
  List<ShopInfo> _filteredShops = [];
  List<ShopInfo> _allShops = [];
  final ScrollController _scrollController = ScrollController();
  ShopInfo? _selectedShop;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _filteredShops = List.from(_allShops);
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (!mounted) return;

    setState(() {
      final query = _searchController.text.toLowerCase();
      _filteredShops = query.isEmpty
          ? List.from(_allShops)
          : _allShops.where((shop) =>
      shop.name?.toLowerCase().contains(query) ?? false).toList();
    });
  }

  void _onMarkerTap(MarkerModel marker) {
    if (!mounted) return;

    setState(() {
      final index = _filteredShops.indexWhere((s) => s.id == marker.id);
      if (index != -1) {
        _selectedShop = _filteredShops[index];
        _scrollController.animateTo(
          index * 300.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  double? _parseCoordinate(String? coord) {
    if (coord == null || coord.isEmpty) return null;
    return double.tryParse(coord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<ShopsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text(state.error ?? "errorException".tr()));
          } else if (state is Empty) {
            return Center(child: Text("noShopsAvailable".tr()));
          } else {
            final bloc = BlocProvider.of<ShopsBloc>(context);
            _allShops = bloc.model.data ?? [];

            if (_searchController.text.isEmpty) {
              _filteredShops = List.from(_allShops);
            }

            final defaultLocation = const LatLng(24.7136, 46.6753);
            final firstShop = _allShops.isNotEmpty ? _allShops.first : null;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Stack(
                children: [
                  // Google Map
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.r),
                      topLeft: Radius.circular(24.r),
                    ),
                    child: _CustomMap(
                      lat: _parseCoordinate(firstShop?.latitude) ?? defaultLocation.latitude,
                      long: _parseCoordinate(firstShop?.longitude) ?? defaultLocation.longitude,
                      markers: _filteredShops.map((shop) => MarkerModel(
                        id: shop.id,
                        lat: _parseCoordinate(shop.latitude) ?? defaultLocation.latitude,
                        lng: _parseCoordinate(shop.longitude) ?? defaultLocation.longitude,
                      )).toList(),
                      onMarkerTap: _onMarkerTap,
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
                          BoxShadow(
                            offset: const Offset(0, 4),
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: TextInputField(
                        controller: _searchController,
                        hintText: "search".tr(),
                        borderColor: Styles.SCAFFOLD_COLOR,
                        prefixIcon: SvgPicture.asset("assets/icons/location-fill.svg"),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            _onSearchChanged();
                          },
                        )
                            : null,
                      ),
                    ),
                  ),

                  // Bottom Shops List
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 140.h,
                      child: _filteredShops.isEmpty
                          ? Center(child: Text("noResults".tr()))
                          : ListView.separated(
                        controller: _scrollController,
                        itemCount: _filteredShops.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        separatorBuilder: (_, __) => SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          final shop = _filteredShops[index];
                          return _ShopCard(shop: shop);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text("discover".tr()),
      centerTitle: true,
      elevation: 0,
      // Add your custom app bar styling here
    );
  }
}

class _ShopCard extends StatelessWidget {
  final ShopInfo shop;

  const _ShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.push(Routes.SHOP_DETAILS, arguments: shop.id),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              spreadRadius: -8,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                shop.image ?? "",
                width: 90.w,
                height: 80.h,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) {
                  return progress == null
                      ? child
                      : Container(
                    width: 90.w,
                    height: 80.h,
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: 90.w,
                    height: 80.h,
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.broken_image)),
                  );
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shop.name ?? "",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/routing.svg",
                        color: Styles.DARK_TEXT_COLOR,
                        width: 16.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        shop.distance ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.DARK_TEXT_COLOR,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        "assets/icons/discount-round.svg",
                        color: Styles.DARK_TEXT_COLOR,
                        width: 16.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${shop.tasksCount} ${"mission".tr()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.DARK_TEXT_COLOR,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "viewDetails".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Styles.GREY_TEXT_COLOR,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomMap extends StatefulWidget {
  final double lat;
  final double long;
  final List<MarkerModel> markers;
  final Function(MarkerModel) onMarkerTap;

  const _CustomMap({
    required this.lat,
    required this.long,
    required this.markers,
    required this.onMarkerTap,
  });

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<_CustomMap> {
  late GoogleMapController _mapController;
  bool _mapReady = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            setState(() {
              _mapController = controller;
              _mapReady = true;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.long),
            zoom: 14,
          ),
          markers: widget.markers.map((marker) => Marker(
            markerId: MarkerId(marker.id.toString()),
            position: LatLng(marker.lat!, marker.lng!),
            onTap: () => widget.onMarkerTap(marker),
          )).toSet(),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          mapToolbarEnabled: true,
        ),
        if (!_mapReady)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}

// class MarkerModel {
//   final int id;
//   final double lat;
//   final double lng;
//
//   MarkerModel({
//     required this.id,
//     required this.lat,
//     required this.lng,
//   });
// }