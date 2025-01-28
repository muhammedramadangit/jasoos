import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/text_styles.dart';
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
            autoFocus: true,
            backgroundColor: Colors.transparent,
            autoDisposeControllers: true,
            autoDismissKeyboard: true,
            enableActiveFill: true,
            controller: controller,
            enablePinAutofill: true,
            keyboardType: TextInputType.number,
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Styles.BLACK_COLOR,
            ),
            pastedTextStyle: TextStyle(color: Styles.BLACK_COLOR),
            mainAxisAlignment: MainAxisAlignment.center,
            cursorHeight: 24.h,
            pinTheme: PinTheme(
              fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8.w),
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(6.r),
              borderWidth: 0.5,
              fieldHeight: 48,
              fieldWidth: 40,
              activeFillColor: Color(0xFFEAEEFF),
              activeColor: Color(0xFFEAEEFF),
              inactiveColor: Color(0xFFEAEEFF),
              inactiveFillColor: Color(0xFFEAEEFF),
              selectedFillColor: Color(0xFFEAEEFF),
              selectedColor: Styles.PRIMARY_COLOR,
              disabledColor: Color(0xFFEAEEFF),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              errorText ?? "Error",
              style: AppTextStyles.w400.copyWith(color: Styles.RED_COLOR, fontSize: 12),
            ),
          ),
      ],
    );
  }
}