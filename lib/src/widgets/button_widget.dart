import 'package:bloc_clean/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  VoidCallback? onClick;
  String? title;
  Color? textColor;
  Color? buttonTextColor;
  Color? disabledTextColor;
  Color? bgColor;
  Color? disabledBgColor;
  Color? splashColor;
  double? borderRadius;
  double? width;
  double? height;
  Color? borderSideColor;
  TextStyle? style;
  Widget? leadingIcon;
  Widget? trailingIcon;
  ShapeBorder? shapeBorder;
  bool? bTitleLg;
  bool? bTitleMd;
  bool? bTitleS;
  bool? bTitleSM;
  bool? bTitleBold;

  ElevatedButtonWidget(
      {Key? key,
      this.onClick,
      this.title,
      this.textColor,
      this.buttonTextColor,
      this.disabledTextColor,
      this.bgColor,
      this.disabledBgColor,
      this.splashColor,
      this.borderRadius,
      this.width,
      this.height,
      this.borderSideColor,
      this.style,
      this.leadingIcon,
      this.trailingIcon,
      this.shapeBorder,
      this.bTitleS,
      this.bTitleBold,
      this.bTitleLg,
      this.bTitleMd,
      this.bTitleSM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (disabledTextColor == null && textColor == null) {
      disabledTextColor = bgColor;
    }
    textColor ??= bgColor;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style/*disabledBgColor == null
              ? ElevatedButton.styleFrom(
                  foregroundColor: bgColor, fixedSize: Size(width!, height!),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                  shape: _shapeBorder())
              : ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) =>
                          states.contains(MaterialState.disabled)
                              ? disabledTextColor!
                              : textColor!),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) =>
                        states.contains(MaterialState.disabled)
                            ? disabledBgColor!
                            : bgColor!,
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(borderRadius ?? 25))))*/,
          onPressed: onClick,
          child: TextWidget(
            text: title?.toUpperCase() ?? "Label",
            small: bTitleS,
            bold: bTitleBold,
            textColor: buttonTextColor,
          )),
    );
  }

  _shapeBorder() =>
      shapeBorder ??
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25));
}
