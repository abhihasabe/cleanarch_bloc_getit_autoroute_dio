import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

TextTheme customTextTheme(TextTheme base, String theme) {
  return base
      .copyWith(
          headline6: base.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline5: base.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline4: base.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline3: base.headline3!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline2: base.headline2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              letterSpacing: -0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline1: base.headline1!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              letterSpacing: -1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle2: base.subtitle2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 0.10,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle1: base.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText2: base.bodyText2!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText1: base.bodyText1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          button: base.button!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 0.75,
              color: theme.contains("darkTheme")
                  ? buttonDarkTextColor
                  : buttonTextColor),
          caption: base.caption!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.4,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          overline: base.overline!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.0,
              letterSpacing: 1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          labelMedium: base.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor))
      .apply(fontFamily: FontNames.openSans);
}
