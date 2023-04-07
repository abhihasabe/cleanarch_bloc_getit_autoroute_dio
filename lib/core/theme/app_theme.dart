import 'package:bloc_clean/core/theme/app_text_styles.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppThemes {
  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static ThemeData themeData(bool isDarkTheme) {
    return isDarkTheme ? darkTheme : lightTheme;
  }

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      primarySwatch: const MaterialColor(0xb2610c0c, <int, Color>{
        50: Color(0x1a610c0c),
        100: Color(0x33610c0c),
        200: Color(0x4d610c0c),
        300: Color(0x66610c0c),
        400: Color(0x80610c0c),
        500: Color(0x99610c0c),
        600: Color(0xb3610c0c),
        700: Color(0xcc610c0c),
        800: Color(0xe6610c0c),
        900: Color(0xff610c0c),
      }),
      backgroundColor: backgroundDarkColor,
      scaffoldBackgroundColor: scaffoldBackgroundDarkColor,
      canvasColor: canvasDarkColor,
      hintColor: hintDarkColor,
      highlightColor: highlightDarkColor,
      hoverColor: hoverColorDarkColor,
      focusColor: focusColor,
      disabledColor: disabledTextDarkColor,
      cardColor: cardDarkBgColor,
      errorColor: errorColor,
      cardTheme: const CardTheme(color: cardDarkBgColor, elevation: 1),
      iconTheme: const IconThemeData(color: iconDarkColor, opacity: 0.8),
      textTheme: customTextTheme(ThemeData.dark().textTheme, "darkTheme"),
      primaryTextTheme:
          customTextTheme(ThemeData.dark().primaryTextTheme, "darkTheme"),
      indicatorColor: indicatorDarkColor,
      colorScheme: const ColorScheme.dark(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundDarkColor,
        selectedItemColor: bottomNavigationBarSelectedIconDarkColor,
        unselectedItemColor: bottomNavigationBarIconDarkColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconDarkColor),
        unselectedIconTheme:
            IconThemeData(color: bottomNavigationBarIconDarkColor),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? disabledTextDarkColor
                      : textColor),
              backgroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? disabledDarkBgColor
                      : buttonDarkBgColor),
              textStyle: const TextStyle(
                  color: buttonTextColor, fontWeight: FontWeight.bold))),
      buttonTheme: ThemeData.dark().buttonTheme.copyWith(
          buttonColor: buttonDarkBgColor,
          disabledColor: disabledBgColor,
          colorScheme: ThemeData.dark()
              .colorScheme
              .copyWith(secondary: buttonDarkBgColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintDarkColor),
        labelStyle: TextStyle(color: labelDarkColor),
        filled: true,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundDarkColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundDarkColor,
        actionsIconTheme: IconThemeData(color: iconDarkColor),
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16,
            color: appBarTextDarkColor,
            fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), labelColor: tabBarSelectedIconDarkColor, unselectedLabelColor: tabBarUnSelectedDarkColor, indicator: BoxDecoration(color: tabBarSelectedIndicatorDarkColor)));
  static ThemeData lightTheme = ThemeData(
      backgroundColor: backgroundColor,
      primarySwatch: const MaterialColor(0xb2610c0c, <int, Color>{
        50: Color(0x1a610c0c),
        100: Color(0x33610c0c),
        200: Color(0x4d610c0c),
        300: Color(0x66610c0c),
        400: Color(0x80610c0c),
        500: Color(0x99610c0c),
        600: Color(0xb3610c0c),
        700: Color(0xcc610c0c),
        800: Color(0xe6610c0c),
        900: Color(0xff610c0c),
      }),
      brightness: Brightness.light,
      canvasColor: canvasColor,
      errorColor: errorColor,
      iconTheme: const IconThemeData(color: iconColor, opacity: 0.8),
      cardTheme: const CardTheme(color: cardBgColor, elevation: 1),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      focusColor: focusColorDarkColor,
      hintColor: hintColor,
      indicatorColor: indicatorColor,
      disabledColor: disabledTextColor,
      cardColor: cardBgColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundColor,
        selectedItemColor: bottomNavigationBarSelectedIconColor,
        unselectedItemColor: bottomNavigationBarIconColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconColor),
        unselectedIconTheme: IconThemeData(color: bottomNavigationBarIconColor),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? disabledTextColor
                      : textDarkColor),
              backgroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? disabledBgColor
                      : buttonBgColor),
              textStyle: const TextStyle(
                  color: buttonTextColor, fontWeight: FontWeight.bold))),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
          buttonColor: buttonBgColor,
          colorScheme:
              ThemeData.light().colorScheme.copyWith(secondary: buttonBgColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: labelColor),
        filled: true,
      ),
      primaryIconTheme: ThemeData.light()
          .primaryIconTheme
          .copyWith(color: const Color(0xFF442B2D)),
      textTheme: customTextTheme(ThemeData.light().textTheme, "lightTheme"),
      primaryTextTheme: customTextTheme(ThemeData.light().primaryTextTheme, "lightTheme"),
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundColor,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundColor,
        actionsIconTheme: IconThemeData(color: iconColor),
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16, color: appBarTextColor, fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), labelColor: tabBarSelectedIconDarkColor, unselectedLabelColor: tabBarUnSelectedColor, indicator: BoxDecoration(color: tabBarSelectedIndicatorColor)));
}
