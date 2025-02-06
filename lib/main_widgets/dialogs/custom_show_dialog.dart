import 'package:flutter/material.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

Future<void> showCustomDialog({bool? dismiss, required Widget dialog}) {
  return showDialog(
    barrierDismissible: dismiss ?? true,
    context: CustomNavigator.navigatorState.currentContext!,
    builder: (_) => dialog,
  );
}