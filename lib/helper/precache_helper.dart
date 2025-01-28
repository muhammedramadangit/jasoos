import 'package:flutter/material.dart';
import 'package:jasoos/helper/constants.dart';

abstract class PrecacheHelper {
  static preCacheHelper(BuildContext context){
    precacheImage(AssetImage(Constants.getAsset("w-logo")), context);
    precacheImage(AssetImage(Constants.getAsset("v1")), context);
    precacheImage(AssetImage(Constants.getAsset("v2")), context);
    precacheImage(AssetImage(Constants.getAsset("v3")), context);
  }
}