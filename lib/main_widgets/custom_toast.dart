import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jasoos/helper/styles.dart';

Future<void> showToast(String msg, {Color? color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 3,
    backgroundColor: color ?? Styles.RED_COLOR,
    textColor: Colors.white,
    fontSize: 16,
  );
}
