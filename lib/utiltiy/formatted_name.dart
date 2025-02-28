abstract class FormattedName {
  static String format(String? fullName) {
    List<String> parts = fullName!.split(" ");
    if (parts.isEmpty) return fullName; // Return as is if empty

    String firstName = parts[0]; // First name
    String lastInitial = parts.length > 1 ? "${parts[1][0]}." : ""; // First letter of last name

    return "${capitalize(firstName)} ${lastInitial.toUpperCase()}";
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}