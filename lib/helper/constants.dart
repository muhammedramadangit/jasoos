
class Constants{
  static String getAsset(String imageName) => "assets/images/$imageName.png";
  static String getLottie(String lottieName) => 'assets/lottie/$lottieName.json';
  static String getSvg(String svg) => 'assets/svg/$svg.svg';
  static String getGif(String gif) => 'assets/gif/$gif.gif';
  static String? device_id;
  static String? userType;
  static int? notificationCount;
  static String testText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consectetur adipiscing elie.";
  static String mapKey = "";
  static String launchMap(String? lat, String? lng) => "https://maps.google.com/maps?q=$lat%2C$lng&z=17&hl=ar";
}