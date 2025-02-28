import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/fields/date_input_field.dart';
import 'package:jasoos/main_widgets/fields/single_select_input_field.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../main_models/user_model.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppStorage.getUser;
    return Column(
      children: [
        TextInputField(
          labelText: "Name",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          controller: TextEditingController(text: userModel?.data?.name ?? ""),
        ),
        TextInputField(
          labelText: "Email",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.emailAddress,
          prefixIcon: SvgPicture.asset(Constants.getSvg("sms")),
          controller: TextEditingController(text: userModel?.data?.email ?? ""),
        ),
        TextInputField(
          labelText: "Phone number",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.phone,
          controller: TextEditingController(text: userModel?.data?.phone ?? ""),
        ),
        DateInputField(
          labelText: "Date Of Brith",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          initialValue: DateTime.now(),
        ),
        SingleSelectInputField(
          labelText: "Gender",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          isExpanded: true,
          initialValue: SelectOption(1, "male"),
          valueSet: [
            SelectOption(1, "male"),
            SelectOption(2, "female"),
          ],
        ),
        SingleSelectInputField(
          labelText: "Marital Status",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          isExpanded: true,
          initialValue: SelectOption(2, "married"),
          valueSet: [
            SelectOption(1, "Divorced"),
            SelectOption(2, "Married"),
            SelectOption(3, "Separated"),
            SelectOption(4, "Widowed"),
            SelectOption(5, "Single"),
          ],
        ),
      ],
    );
  }
}
