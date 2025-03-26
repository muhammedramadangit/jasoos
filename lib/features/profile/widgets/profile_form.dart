import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/fields/date_input_field.dart';
import 'package:jasoos/main_widgets/fields/single_select_input_field.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../core/app_event.dart';
import '../bloc/profile_bloc.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileBloc bloc = ProfileBloc.instance;
    return Column(
      children: [
        TextInputField(
          labelText: "Name",
          hintText: "Name",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          controller: bloc.name,
          errorText: bloc.nameError,
          hasError: !bloc.nameValidation,
          onChange: (value) {
            if (!bloc.nameValidation) {
              bloc.nameValidation = true;
            }
            bloc.add(Update());
          },
        ),
        TextInputField(
          labelText: "Email",
          hintText: "Email",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.emailAddress,
          // prefixIcon: SvgPicture.asset(Constants.getSvg("sms")),
          controller: bloc.email,
          errorText: bloc.emailError,
          hasError: !bloc.emailValidation,
          onChange: (value) {
            if (!bloc.emailValidation) {
              bloc.emailValidation = true;
            }
            bloc.add(Update());
          },
        ),
        TextInputField(
          labelText: "Phone number",
          hintText: "Phone number",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.phone,
          controller: bloc.phone,
          errorText: bloc.phoneError,
          hasError: !bloc.phoneValidation,
          initialSelectionCountryCode: bloc.phoneCode,
          onChangedCountryCode: (value) {
            bloc.phoneCode = value.code;
            bloc.add(Update());
          },
          onChange: (value) {
            if (!bloc.phoneValidation) {
              bloc.phoneValidation = true;
            }
            bloc.add(Update());
          },
        ),
        DateInputField(
          labelText: "Date Of Brith",
          hintText: "Date Of Brith",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          initialValue: bloc.birthday,
          errorText: bloc.birthdayError,
          hasError: !bloc.birthdayValidation,
          onChange: (value) {
            if (!bloc.birthdayValidation) {
              bloc.birthdayValidation = true;
            }
            bloc.add(Update());
          },
        ),
        SingleSelectInputField(
          labelText: "Gender",
          hintText: "Gender",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          isExpanded: true,
          initialValue: bloc.gender?.value == "null" ? null : bloc.gender,
          valueSet: [
            SelectOption("male", "male"),
            SelectOption("female", "female"),
          ],
          errorText: bloc.genderError,
          hasError: !bloc.genderValidation,
          onChange: (value) {
            bloc.gender = value;
            if (!bloc.genderValidation) {
              bloc.genderValidation = true;
            }
            bloc.add(Update());
          },
        ),
        SingleSelectInputField(
          labelText: "Marital Status",
          hintText: "Marital Status",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          isExpanded: true,
          initialValue: bloc.maritalStatus?.value != "null" ? bloc.maritalStatus : null,
          valueSet: [
            SelectOption("Divorced", "Divorced"),
            SelectOption("Married", "Married"),
            SelectOption("Separated", "Separated"),
            SelectOption("Widowed", "Widowed"),
            SelectOption("Single", "Single"),
          ],
          errorText: bloc.maritalStatusError,
          hasError: !bloc.maritalStatusValidation,
          onChange: (value) {
            bloc.maritalStatus = value;
            if (!bloc.maritalStatusValidation) {
              bloc.maritalStatusValidation = true;
            }
            bloc.add(Update());
          },
        ),
      ],
    );
  }
}
