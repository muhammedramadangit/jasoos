import 'package:get_storage/get_storage.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class AppStorage {
  static GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static void cacheToken(String value) => _box.write('token', value);

  static void cacheEmail(String value) => _box.write('email', value);

  static void cacheOpenOnboarding(int id) => _box.write('onboarding', id);

  // static Future<void> cacheUser(UserModel? user) async => await _box.write('user', user!.toJson());

  // static UserModel? get getUser => _box.read("user") != null ? UserModel.fromJson(_box.read("user")) : null;

  static int get getOpenOnboarding => _box.read('onboarding') ?? 0;

  static String? get getToken => _box.read('token');

  static String get getEmail => _box.read('email') ?? "";

  static bool get isLogged => _box.hasData('token');

  static void removeCache() {
    _box.erase();
    cacheOpenOnboarding(1);
  }

  static Future signOut() async {
    await _box.erase();
    CustomNavigator.push(Routes.SPLASH, clean: true);
    cacheOpenOnboarding(1);
  }
}
