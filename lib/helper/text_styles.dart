import 'package:flutter/material.dart';

import '../network/network_layer.dart';

abstract class AppTextStyles {
  /// Space Grotesk fonts
  static TextStyle w100 = TextStyle(fontWeight: FontWeight.w100, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "IBMPlexSansArabic-Thin");

  static TextStyle w200 = TextStyle(fontWeight: FontWeight.w200, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "IBMPlexSansArabic-ExtraLight");

  static TextStyle w300 = TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Light" : "IBMPlexSansArabic-Light");

  static TextStyle w400 = TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Regular" : "IBMPlexSansArabic-Regular");

  static TextStyle w500 = TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "IBMPlexSansArabic-Medium");

  static TextStyle w600 = TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-SemiBold" : "IBMPlexSansArabic-SemiBold");

  static TextStyle w700 = TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "IBMPlexSansArabic-Bold");

  static TextStyle w800 = TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "IBMPlexSansArabic-Bold");

  static TextStyle w900 = TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontFamily: Network.lang == "en" ? "SpaceGrotesk-Bold" : "IBMPlexSansArabic-Bold");
}