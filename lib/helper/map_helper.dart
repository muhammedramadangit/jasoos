import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  final double? lat;
  final double? long;
  final bool? isScroll;
  final double? height;
  final double? width;
  final double? radius;
  final List<dynamic>? locations;
  final onTap;
  final CameraPosition? initialCameraPosition;
  // final Set<Marker>? markers;
  final List<MarkerModel> markers;
  final void Function(GoogleMapController)? onMapCreated;

  const CustomMap({
    Key? key,
    @required this.lat,
    @required this.long,
    this.onTap,
    this.height,
    this.locations,
    this.width,
    this.radius,
    this.isScroll = true,
    required this.markers, this.initialCameraPosition, this.onMapCreated,
    // required this.daycareList,
  }) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Set<Marker> _markers = Set();
  Set<Circle> circles = Set();
  final customCircle = [];

  late LatLng latLng;

  GoogleMapController? mapController;

  //current Location
  onMapCreated(GoogleMapController? controller) {
    mapController = controller;
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(widget.lat!, widget.long!), zoom: 15),
    ));
    // _markers = widget.markers ?? Set();
  }

  Future<Uint8List> resizeAssetImage(String assetName,
      {required double width, required double height}) async {
    ByteData data = await rootBundle.load(assetName);
    final codec = await ui.instantiateImageCodec(
        Uint8List.sublistView(data.buffer.asUint8List()));
    final frameInfo = await codec.getNextFrame();
    final image = frameInfo.image;

    final recorder = ui.PictureRecorder();
    final canvas =
        Canvas(recorder, Rect.fromPoints(Offset(0, 0), Offset(width, height)));
    canvas.drawImageRect(
      image,
      Rect.fromPoints(Offset(0, 0),
          Offset(image.width.toDouble(), image.height.toDouble())),
      Rect.fromPoints(Offset(0, 0), Offset(width, height)),
      Paint(),
    );

    final resizedImage =
        await recorder.endRecording().toImage(width.toInt(), height.toInt());
    final resizedImageBytes =
        await resizedImage.toByteData(format: ui.ImageByteFormat.png);

    return resizedImageBytes!.buffer.asUint8List();
  }

  getImage() async {
    // setState(() {
    for (MarkerModel marker in widget.markers) {
      try {
        // Uint8List imageBytes =
        //     await getImageBytesFromUrl(daycare.profile ?? '');
        // Uint8List resizedImageBytes =
        //     await resizeImageBytes(imageBytes, width: 160, height: 160);
        // _markers.add(Marker(
        //     markerId: MarkerId(daycare.id.toString()),
        //     position: LatLng(
        //         double.tryParse(daycare.lat.toString()) ?? 31.0315084,
        //         double.tryParse(daycare.lang.toString()) ?? 31.3905576),
        //     icon: BitmapDescriptor.fromBytes(resizedImageBytes)));
        Uint8List resizedImage = await resizeAssetImage("assets/images/marker.png", width: 36, height: 48);
        _markers.add(
          Marker(
            markerId: MarkerId(marker.id.toString()),
            position: LatLng(
              double.tryParse(marker.lat.toString()) ?? 31.0315084,
              double.tryParse(marker.lng.toString()) ?? 31.3905576,
            ),
            icon: await BitmapDescriptor.fromBytes(resizedImage),
          ),
        );
      } catch (error) {
        _markers.add(
          Marker(
            markerId: MarkerId(marker.id.toString()),
            position: LatLng(
              double.tryParse(marker.lat.toString()) ?? 31.0315084,
              double.tryParse(marker.lng.toString()) ?? 31.3905576,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(36, 48)),
              "assets/images/marker.png",
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    getImage();
    latLng = LatLng(widget.lat ?? 31.0315084, widget.long ?? 31.3905576);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        } else {
          return ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(widget.radius ?? 15.0),
              topLeft: Radius.circular(widget.radius ?? 15.0),
            ),
            child: SizedBox(
              height: widget.height,
              width: widget.width ?? MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: GoogleMap(
                  initialCameraPosition: widget.initialCameraPosition ?? CameraPosition(
                    target: latLng,
                    zoom: 15.0,
                  ),
                  circles: circles,
                  zoomGesturesEnabled: true,
                  trafficEnabled: true,
                  onTap: (position) {},
                  onMapCreated: widget.onMapCreated ?? onMapCreated,
                  mapToolbarEnabled: true,
                  onCameraMove: (position) {
                    latLng = position.target;
                  },
                  zoomControlsEnabled: false,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer()),
                  },
                  myLocationButtonEnabled: false,
                  markers: _markers,
                  scrollGesturesEnabled: widget.isScroll!,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class MarkerModel {
  int? id;
  double? lat;
  double? lng;

  MarkerModel({this.id, this.lat, this.lng});
}
