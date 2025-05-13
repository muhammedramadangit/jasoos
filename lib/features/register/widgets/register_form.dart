import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc bloc = RegisterBloc.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          hintText: tr("name"),
          prefixIcon: SvgPicture.asset(Constants.getSvg("profile")),
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
          hintText: tr("yourNumber"),
          keyboardType: TextInputType.phone,
          controller: bloc.phone,
          errorText: bloc.phoneError,
          hasError: !bloc.phoneValidation,
          initialSelectionCountryCode: bloc.countryCode ?? "+966",
          onChangedCountryCode: (value) {
            bloc.countryCode = value.code;
            bloc.add(Update());
          },
          onChange: (value) {
            if (!bloc.phoneValidation) {
              bloc.phoneValidation = true;
            }
            bloc.add(Update());
          },
        ),

        TextInputField(
          hintText: tr("email"),
          prefixIcon: SvgPicture.asset(Constants.getSvg("sms")),
          keyboardType: TextInputType.emailAddress,
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
          hintText: "${tr("invitingCode")} (${tr("optional")})",
          prefixIcon: SvgPicture.asset(
            Constants.getSvg("group"),
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              Styles.GREY_COLOR,
              BlendMode.srcIn,
            ),
          ),
          keyboardType: TextInputType.text,
          controller: bloc.invitingCode,
        ),

        TextInputField(
          hintText: tr("password"),
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          keyboardType: TextInputType.visiblePassword,
          withBottomPadding: false,
          controller: bloc.password,
          errorText: bloc.passwordError,
          hasError: !bloc.passwordValidation,
          hasValidationHint: true,
          validationHint: tr("VPass"),
          validationHintStyle: AppTextStyles.w400.copyWith(
            fontSize: 15,
            color: bloc.password.text.isEmpty
                ? Styles.GREY_COLOR
                : (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])\S{8,}$').hasMatch(bloc.password.text.trim()) == true)
                ? Styles.LIGHT_GREEN_TEXT_COLOR
                : Styles.RED_COLOR,
          ),
          onChange: (value) {
            if (!bloc.passwordValidation) {
              bloc.passwordValidation = true;
            }
            bloc.add(Update());
          },
        ),
      ],
    );
  }
}
