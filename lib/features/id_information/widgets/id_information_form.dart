import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../core/app_event.dart';
import '../../../core/app_state.dart';
import '../../../helper/image_picker_helper.dart';
import '../bloc/id_information_bloc.dart';

class IdInformationForm extends StatelessWidget {
  const IdInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdInformationBloc, AppState>(
      builder: (context, state) {
        IdInformationBloc bloc = IdInformationBloc.instance;
        return Column(
          children: [
            TextInputField(
              labelText: tr("idNumber"),
              hintText: tr("idNumber"),
              labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
              keyboardType: TextInputType.number,
              controller: bloc.idController,
              errorText: bloc.idError,
              hasError: !bloc.idValidation,
              onChange: (value) {
                if (!bloc.idValidation) {
                  bloc.idValidation = true;
                }
                bloc.add(Update());
              },
            ),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Styles.BORDER_COLOR),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Constants.getSvg("gallery"), height: 32, width: 32),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr("id"),
                          style: AppTextStyles.w500.copyWith(fontSize: 14),
                        ),
                        SizedBox(height: 4.h),
                        bloc.idImage != null
                            ? Text(
                                "${bloc.idImage?.path.split('/').last}   ${(bloc.sizeInBytes! / 1024).toStringAsFixed(2)}KB",
                                style: AppTextStyles.w400.copyWith(
                                  fontSize: 12,
                                  color: Styles.GREY_TEXT_COLOR,
                                ),
                              )
                            : Text(
                                "${AppStorage.getUser?.data?.idImage?.split('/').last}",
                                style: AppTextStyles.w400.copyWith(
                                  fontSize: 12,
                                  color: Styles.GREY_TEXT_COLOR,
                                ),
                              ),
                      ],
                    ),
                  ),
                  8.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      ImagePickerHelper.showOption(
                        onGet: (value) async {
                          bloc.idImage = value;
                          bloc.sizeInBytes = await bloc.idImage!.length();
                          bloc.add(Update());
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      Constants.getSvg("edit"),
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
                    ),
                  ),
                  // SizedBox(width: 8.w),
                  // Icon(CupertinoIcons.clear_circled, color: Styles.RED_COLOR),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
