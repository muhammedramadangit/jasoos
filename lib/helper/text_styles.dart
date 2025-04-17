import 'package:flutter/material.dart';

import '../network/network_layer.dart';

abstract class AppTextStyles {
  /// Space Grotesk fonts
  static TextStyle w100 = TextStyle(fontWeight: FontWeight.w100, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "cairo-extra-light");

  static TextStyle w200 = TextStyle(fontWeight: FontWeight.w200, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "cairo-extra-light");

  static TextStyle w300 = TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "cairo-light");

  static TextStyle w400 = TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Regular" : "cairo-regular");

  static TextStyle w500 = TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium");

  static TextStyle w600 = TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-SemiBold" : "cairo-semi-bold");

  static TextStyle w700 = TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "cairo-bold");

  static TextStyle w800 = TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "cairo-extra-bold");

  static TextStyle w900 = TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "cairo-black");
}