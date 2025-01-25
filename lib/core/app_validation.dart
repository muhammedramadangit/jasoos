import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

mixin AppValidations {
  static String? email(String? value) {
    RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty)
      return tr("empty");
    else if (!regExp.hasMatch(value.trim()))
      return 'EX: example@mail.com';
    else
      return "";
  }

  static String? empty(String? value) {
    if (value!.isEmpty)
      return tr("empty");
    else if (RegExp(r'\s{2,}').hasMatch(value.replaceAll(RegExp(r'\s+'), ' ').trim())) {
      return tr("VNameAvoidSpace");
    }
    else
      return "";
  }

  static String? any(String? value, {String? message}) {
    if (value!.isEmpty)
      return message ?? tr("empty");
    else
      return "";
  }

  static String? city(String? value) {
    if (value!.isEmpty)
      return tr("VCity");
    else
      return "";
  }

  static String? name(String? value) {
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (value!.isEmpty)
      return tr("empty");
    else if (value.length < 3)
      return tr("VName");
    else if (RegExp(r'\s{2,}').hasMatch(value.replaceAll(RegExp(r'\s+'), ' ').trim())) {
      return tr("VNameAvoidSpace");
    } else if (!regex.hasMatch(value))
      return tr("enterNameLikePassport");
    else
      return "";
  }

  static String? phone(String? value) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    if (value!.isEmpty)
      return tr("empty");
    else if (value.length < 8 || value.length > 10)
      return tr("VPhoneLength");
    else if (!regex.hasMatch(value))
      return tr("VPhone");
    else
      return "";
  }

  static String? password(String? value) {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])\S{8,}$');

    if (value!.isEmpty) {
      return tr("empty");
    } else if (!regExp.hasMatch(value.trim())) {
      return tr("VPass");
    } else {
      return "";
    }
  }

  static String? code(String? value) {
    if (value!.isEmpty)
      return tr("empty");
    else if (value.length < 4)
      return tr("invalidCode");
    else
      return "";
  }

  static String? nationality(String? value) {
    if (value!.isEmpty)
      return tr("VNationality");
    else
      return "";
  }

  static String? birthday(String? value) {
    if (value!.isEmpty)
      return tr("VBirthdate");
    else
      return "";
  }

  static String? gender(int? value) {
    if (value == null || value == -1)
      return tr("VGender");
    else
      return "";
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password!.isEmpty)
      return tr("empty");
    else if (password != confirmPassword)
      return tr("passwordDoesNotMatch");
    else
      return "";
  }
}

// Custom formatter to convert all input to uppercase
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}