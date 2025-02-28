import 'package:get_storage/get_storage.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/login/bloc/login_bloc.dart';
import 'package:jasoos/main_models/user_model.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class AppStorage {
  static GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static void cacheToken(String? value) => _box.write('token', value);

  static void cachePhone(String value) => _box.write('phone', value);

  static void cachePhoneCode(String value) => _box.write('phone_code', value);

  static void cacheOpenOnboarding(int id) => _box.write('onboarding', id);

  static Future<void> cacheUser(UserModel? user) async => await _box.write('user', user != null ? user.toJson() : null);

  static void cacheRememberMe(bool value) => _box.write('remember_user', value);

  static void cacheUserPhone(String value) => _box.write('user_phone', value);

  static void cacheUserPassword(String value) => _box.write('user_password', value);

  static void cacheUserLat(String value) => _box.write('user_lat', value);

  static void cacheUserLng(String value) => _box.write('user_lng', value);

  //----------------------------------------------------------------------------

  static bool? get getRememberUser => _box.read('remember_user');

  static String? get getUserPhone => _box.read('user_phone');

  static String? get getUserPassword => _box.read('user_password');

  static UserModel? get getUser => _box.read("user") != null ? UserModel.fromJson(_box.read("user")) : null;

  static int get getOpenOnboarding => _box.read('onboarding') ?? 0;

  static String? get getToken => _box.read('token') ?? null;

  static String get getPhone => _box.read('phone') ?? "";

  static String get getPhoneCode => _box.read('phone_code') ?? "+966";

  static String get getUserLat => _box.read('user_lat');

  static String get getUserLng => _box.read('user_lng');

  static bool get isLogged => _box.hasData('token');

  static void removeCache() {
    _box.erase();
    cacheOpenOnboarding(1);
  }

  static Future signOut() async {
    // await _box.erase();
    cacheToken(null);
    cachePhone("");
    cachePhoneCode("");
    cacheUser(null);
    cacheOpenOnboarding(1);
    LoginBloc.instance.add(Check());
    CustomNavigator.push(Routes.SPLASH, clean: true);
  }
}
