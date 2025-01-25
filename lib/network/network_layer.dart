import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jasoos/app_config/app_config.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:jasoos/network/mapper.dart';
import 'package:jasoos/network/network_logger.dart';
import 'package:jasoos/utiltiy/utility.dart';


enum ServerMethods { GET, POST, UPDATE, DELETE, PUT, PATCH }

class Network {
  static Network? _instance;
  static String? lang;
  static Dio _dio = Dio();
  bool isActiveUser = true;
  Network._private();

  factory Network() {
    if (_instance == null) {
      _dio.options.connectTimeout = Duration(seconds: 60);
      _dio.interceptors.add(NetworkLogger.logger);
      _instance = Network._private();
    }
    return _instance!;
  }

  Future<dynamic> request(
      String endpoint, {
        body,
        String? baseUrl,
        Mapper? model,
        Map<String, dynamic>? query,
        Map<String, dynamic>? header,
        ServerMethods method = ServerMethods.GET,
      }) async {
    String? _token = AppStorage.getToken;

    _dio.options.headers = header ?? {
      if(_token != null)
        'Authorization': 'Bearer $_token',
      'Accept': 'application/json',
      "User-Agent": "Dart",
      'Accept-Language': lang,
    };
    var check = await Connectivity().checkConnectivity();
    log("CONNECTIVITY NETWORK LAYER ${check} || CONDITION ${check.contains(ConnectivityResult.none)}");
    try {
      if(check.contains(ConnectivityResult.none) == true) {
        if(method == ServerMethods.GET) {
          CustomNavigator.push(Routes.NO_INTERNET);
        } else {
          showToast(tr("checkInternet"));
        }
      } else {
        Response response = await _dio.request(
          (baseUrl ?? AppConfig.BASE_URL) + endpoint,
          data: body,
          queryParameters: query,
          options: Options(
            method: method.name,
          ),
        );
        isActiveUser = true;
        log("RESPONSE STATUS ${response.statusCode}");
        if (model == null) {
          return response;
        } else {
          return Mapper(model, response.data);
        }
      }
    } on SocketException catch (e) {
      cprint(
        "SocketException: ${e.address}",
        errorIn: (baseUrl ?? AppConfig.BASE_URL) + endpoint,
        label: "SocketException",
      );
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
      rethrow;
    } on DioError catch (e) {
      cprint(
        "| Error: ${e.error}: ${e.response?.toString()}",
        errorIn: "${(baseUrl ?? AppConfig.BASE_URL) + endpoint}",
        label: "DioError",
      );
      // if(e.response?.statusCode == 401) {
      //   showCustomDialog(dialog: LoginDialog(
      //     message: e.response?.data["message"].toString().replaceAll("detail: ", ""),
      //   ));
      // }
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
      if (model == null) {
        return e.response;
      } else {
        return Mapper(model, e.response?.data);
      }
    } catch (error) {
      cprint(
        "Unhandled Exception: $error",
        errorIn: (baseUrl ?? AppConfig.BASE_URL) + endpoint,
        label: "Unhandled Exception",
      );
      cprint("└------------------------------------------------------------------------------");
      cprint("================================================================================");
      rethrow;
    }
  }
}