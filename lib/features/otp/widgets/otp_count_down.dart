import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class OtpCountDown extends StatefulWidget {
  const OtpCountDown({this.timeBySecond = 60, this.onCount});
  final int timeBySecond;
  final Function? onCount;

  @override
  State<OtpCountDown> createState() => _OtpCountDownState();
}

class _OtpCountDownState extends State<OtpCountDown> {
  late Timer _timer;
  int _count = 0;
  @override
  void initState() {
    countDown();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  countDown() {
    setState(() => _count = widget.timeBySecond);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count != 0) {
        setState(() => --_count);
      } else {
        if (_timer.isActive) _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Didn’t receive code? ",
            style: AppTextStyles.w500.copyWith(fontSize: 14),
          ),
          InkWell(
            onTap: () {
              if(_count == 0){
                countDown();
                widget.onCount!();
              }
            },
            child: Text(
              _count == 0
                  ? "Resend"
                  : "send after (${Duration(seconds: _count).inMinutes.remainder(60).toString().padLeft(2, '0')}:${Duration(seconds: _count).inSeconds.remainder(60).toString().padLeft(2, '0')})",
              style: AppTextStyles.w600.copyWith(fontSize: 14, color: Styles.PRIMARY_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}