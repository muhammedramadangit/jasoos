import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_expandable_widget.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Help Center"),
      body: SingleChildScrollView(
        padding: Styles.SCREEN_PADDING,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            TextInputField(
              hintText: "What can we help?",
              keyboardType: TextInputType.text,
              prefixIcon: SvgPicture.asset(Constants.getSvg("search")),
              withBottomPadding: false,
            ),

            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 28.h),
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return CustomExpandableWidget(
                  title: Text(
                    "Lorem ipsum dolor sit amet",
                    style: AppTextStyles.w500.copyWith(fontSize: 16),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 14,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
