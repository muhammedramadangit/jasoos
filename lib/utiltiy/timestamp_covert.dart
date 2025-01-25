
abstract class TimestampCovert {
  static String formattedDate(String timestamp) {
    int _timestamp = int.parse(timestamp);

    // convert milliseconds to DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(_timestamp);

    // Format the date
    String formattedDate = "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    return formattedDate;
  }
}