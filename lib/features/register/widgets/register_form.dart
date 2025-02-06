import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/helper/constants.dart';
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
          hintText: "Name",
          prefixIcon: SvgPicture.asset(Constants.getSvg("profile")),
          keyboardType: TextInputType.name,
          controller: bloc.name,
          errorText: bloc.nameError,
          hasError: !bloc.nameValidation,
          onChange: (value) {
            if (!bloc.nameValidation) {
              bloc.nameValidation = true;
              bloc.add(Update());
            }
          },
        ),

        TextInputField(
          hintText: "Your number",
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
              bloc.add(Update());
            }
          },
        ),

        TextInputField(
          hintText: "Email",
          prefixIcon: SvgPicture.asset(Constants.getSvg("sms")),
          keyboardType: TextInputType.emailAddress,
          controller: bloc.email,
          errorText: bloc.emailError,
          hasError: !bloc.emailValidation,
          onChange: (value) {
            if (!bloc.emailValidation) {
              bloc.emailValidation = true;
              bloc.add(Update());
            }
          },
        ),

        TextInputField(
          hintText: "Password",
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          keyboardType: TextInputType.visiblePassword,
          withBottomPadding: false,
          controller: bloc.password,
          errorText: bloc.passwordError,
          hasError: !bloc.passwordValidation,
          onChange: (value) {
            if (!bloc.passwordValidation) {
              bloc.passwordValidation = true;
              bloc.add(Update());
            }
          },
        ),
      ],
    );
  }
}
