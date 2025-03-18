import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class BankAccountRepo {
  static Future changeBankAccount(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.UPDATE_BANK_ACCOUNT,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}