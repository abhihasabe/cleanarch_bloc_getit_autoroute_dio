import 'package:bloc_clean/core/theme/app_font_size.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastHelper {
  static showToast(
      BuildContext context, String msg, ToastGravity toastGravity) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        fontSize: font16,
        textColor: textColor,
        gravity: ToastGravity.BOTTOM);
  }
}
