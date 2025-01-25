import 'package:easy_localization/easy_localization.dart';


// Helper function to format minutes into HH:mm
String formatTime(int minutes) {
  final hours = (minutes ~/ 60).toString().padLeft(2, '0');
  final mins = (minutes % 60).toString().padLeft(2, '0');
  return "$hours:$mins";
}

extension DateFormatter on DateTime {
  /// yyyy-MM-dd
  String toYearMonthDayFormat() {
    return "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }

  /// yyyy-MM-dd HH:mm: a
  String toYearMonthDayHourMinuteSecondFormat() {
    return "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} . ${DateFormat('hh:mm a').format(this)}";
  }

  /// HH:mm:ss
  String toHoursMinutesSeconds() =>
      "${this.hour} : ${this.minute} : ${this.second}";

  // /// HH:mm a
  // String toHoursMinutesPer() {
  //   String lang = CustomNavigator.navigatorState.currentContext!.locale.languageCode;
  //   String hours = "${this.hour > 12 ? ((this.hour - 12).toString().length == 1 ? "0${this.hour - 12}" : this.hour - 12) : this.hour}";
  //   if(lang == "ar") {
  //     return "${this.minute} : $hours ${this.hour > 12 ? "م" : "ص"}";
  //   } else {
  //     return "$hours : ${this.minute} ${this.hour > 12 ? "PM" : "AM"}";
  //   }
  // }


  /// HH:mm
  String toHoursMinutes() =>
      "${this.minute} : ${this.hour > 12 ? this.hour - 12 : this.hour}";

  /// HH:mm a
  String toFormattedTime() {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, this.hour, this.minute);
    final formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

  /// calculate duration between to string dates
  /// 00 hr 00 min
  static String calculateDuration(String firstDate, String lastDate, {DurationTypes? type = DurationTypes.all}) {
    final first = DateFormat("yyyy-MM-ddThh:mm:ss").parse(firstDate);
    final last = DateFormat("yyyy-MM-ddThh:mm:ss").parse(lastDate);
    final differance = last.difference(first);
    int days = differance.inDays;
    int hours = differance.inHours % 24;
    int minutes = differance.inMinutes % 60;
    int seconds = differance.inSeconds % 60;
    print("$days day(s) $hours hour(s) $minutes minute(s) $seconds second(s).");

    if(type == DurationTypes.days) {
      return "$days";
    } else if(type == DurationTypes.hours) {
      return "$hours";
    } else if(type == DurationTypes.minutes) {
      return "$minutes";
    } else if(type == DurationTypes.seconds) {
      return "$seconds";
    } else {
      return "${hours != 0 ? "$hours ${"hour".tr()}" : ""}${minutes != 0 ? " $minutes ${"minute".tr()}" : ""}";
    }
  }
}

enum DurationTypes{
  all,
  days,
  hours,
  minutes,
  seconds,
}