import 'package:easy_localization/easy_localization.dart';

extension rateFormatter on double {
  String toRateFormat() {
    switch (this) {
      case >= 9:
        return "excellent".tr();
      case >= 8 && < 9:
        return "veryGood".tr();
      case >= 7 && < 8:
        return "good".tr();
      case >= 6 && < 7:
        return "aboveAverage".tr();
      case >= 5 && < 6:
        return "average".tr();
      case >= 4 && < 5:
        return "belowAverage".tr();
      case >= 3 && < 4:
        return "fair".tr();
      case >= 2 && < 3:
        return "poor".tr();
      case >= 1 && < 2:
        return "veryPoor".tr();
      default:
        return "";
    }
  }
}