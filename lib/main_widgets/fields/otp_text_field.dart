import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/helper/styles.dart';

class OtpTextField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChange;
  final TextEditingController? controller;
  final String? errorText;
  final bool hasError;

  OtpTextField({this.onSave, required this.onChange, this.controller, this.errorText, this.hasError = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            validator: (v) => AppValidations.code(v!),
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor: Styles.PRIMARY_COLOR,
            backgroundColor: Colors.transparent,
            autoDisposeControllers: true,
            autoDismissKeyboard: true,
            enableActiveFill: true,
            controller: controller,
            enablePinAutofill: true,
            keyboardType: TextInputType.number,
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Styles.BLACK_COLOR,
            ),
            pastedTextStyle: TextStyle(color: Styles.BLACK_COLOR),
            mainAxisAlignment: MainAxisAlignment.center,
            cursorHeight: 24.h,
            pinTheme: PinTheme(
              fieldOuterPadding: EdgeInsets.symmetric(horizontal: 12.w),
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12.r),
              fieldHeight: 55,
              fieldWidth: 55,
              activeFillColor: Colors.transparent,
              activeColor: Styles.BORDER_COLOR,
              inactiveColor: Styles.BORDER_COLOR,
              inactiveFillColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              selectedColor: Styles.PRIMARY_COLOR,
              disabledColor: Styles.BORDER_COLOR,
            ),
            appContext: context,
            length: 4,
            onSaved: onSave,
            onChanged: onChange,
            errorTextSpace: 30,
          ),
        ),
        if (hasError) const SizedBox(height: 8),
        if (hasError)
          Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 16),
              SizedBox(width: 4),
              Text(errorText ?? "Error", style: const TextStyle(color: Colors.red)),
            ],
          ),
      ],
    );
  }
}