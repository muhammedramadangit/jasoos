import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/helper/styles.dart';

class OtpTextField extends StatefulWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChange;
  final TextEditingController? controller;
  final String? errorText;
  final bool hasError;
  final void Function(String)? onCompleted;

  OtpTextField({this.onSave, required this.onChange, this.controller, this.errorText, this.hasError = false, this.onCompleted});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {

  @override
  void initState() {
    if (mounted) {
      setState(() {
        // Update UI safely
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

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
            controller: widget.controller,
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
              activeFillColor: Styles.HIGHLIGHT_COLOR,
              activeColor: Styles.HIGHLIGHT_COLOR,
              inactiveColor: Styles.HIGHLIGHT_COLOR,
              inactiveFillColor: Styles.HIGHLIGHT_COLOR,
              selectedFillColor: Styles.HIGHLIGHT_COLOR,
              selectedColor: Styles.PRIMARY_COLOR,
              disabledColor: Styles.HIGHLIGHT_COLOR,
            ),
            appContext: context,
            length: 4,
            onSaved: widget.onSave,
            onChanged: widget.onChange,
            onCompleted: widget.onCompleted,
            errorTextSpace: 30,
          ),
        ),
        if (widget.hasError) const SizedBox(height: 8),
        if (widget.hasError)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              widget.errorText ?? "Error",
              style: AppTextStyles.w400.copyWith(color: Styles.RED_COLOR, fontSize: 12),
            ),
          ),
      ],
    );
  }
}