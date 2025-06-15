import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../helper/styles.dart';
import '../network/network_layer.dart';

class HtmlText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? horPadding;
  final double? verPadding;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? textHeight;
  final Alignment? alignment;
  final TextDecoration? decoration;

  const HtmlText(this.text, {
    Key? key,
    this.horPadding,
    this.verPadding,
    this.color,
    this.fontSize,
    this.maxLines,
    this.textAlign, this.alignment, this.textHeight, this.decoration, this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horPadding ?? 0, vertical: verPadding ?? 0),
      child: Html(
        data: text,
        style: {
          "table": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          "tr": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            border: const Border(bottom: BorderSide(color: Colors.grey)),
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          "th": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          "td": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          'h1': Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Styles.PRIMARY_COLOR,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight ?? FontWeight.w700,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          'h2': Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Styles.PRIMARY_COLOR,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight ?? FontWeight.w700,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          'h3': Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            maxLines: maxLines,
            color: color ?? Styles.PRIMARY_COLOR,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight ?? FontWeight.w700,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          'h4': Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            lineHeight: LineHeight.number(textHeight ?? 1),
            maxLines: maxLines,
            color: color ?? Styles.PRIMARY_COLOR,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight ?? FontWeight.w500,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          'h5': Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            lineHeight: LineHeight.number(textHeight ?? 1),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight ?? FontWeight.w300,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          "p": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            // lineHeight: LineHeight.number(textHeight ?? 1.2),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
          "li": Style(
            padding: HtmlPaddings.symmetric(vertical: 0, horizontal: 0),
            margin: Margins.symmetric(vertical: 0, horizontal: 0),
            // lineHeight: LineHeight.number(textHeight ?? 1.2),
            maxLines: maxLines,
            color: color ?? Colors.black,
            fontSize: FontSize(fontSize ?? 14),
            fontWeight: fontWeight,
            textAlign: textAlign,
            alignment: alignment,
            fontFamily: Network.lang == "en" ? "SpaceGrotesk-Medium" : "cairo-medium",
          ),
        },
      ),
    );
  }
}