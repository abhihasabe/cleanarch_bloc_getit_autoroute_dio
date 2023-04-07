import 'package:bloc_clean/core/constants/app_constant.dart';
import 'package:bloc_clean/core/theme/app_font_size.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputTextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final String? errorMessage;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? showSuffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final TextCapitalization? textCapitalization;
  final int? maxLine;
  final Function(dynamic)? onChange;
  final AutovalidateMode? autoValidateMode;
  final bool? readOnly;
  final Color? cursorColor;

  const InputTextFormFieldWidget(
      {Key? key,
      this.hintText,
      this.autoValidateMode,
      this.errorMessage,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.onChange,
      this.obscureText = false,
      this.showSuffixIcon = false,
      this.controller,
      this.functionValidate,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.maxLine,
      this.suffixIcon,
      this.textCapitalization,
      this.readOnly,
      this.cursorColor})
      : super(key: key);

  @override
  InputTextFormFieldWidgetState createState() =>
      InputTextFormFieldWidgetState();
}

class InputTextFormFieldWidgetState extends State<InputTextFormFieldWidget> {
  double bottomPaddingToError = font12;
  bool? obSecure;
  int inputLength = 0;
  dynamic appBrightness;

  @override
  void initState() {
    super.initState();
    obSecure = widget.obscureText;
    appBrightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('textField'),
      readOnly: widget.readOnly == null ? false : widget.readOnly!,
      autovalidateMode: widget.autoValidateMode,
      cursorColor:
          (appBrightness == Brightness.dark) ? cursorDarkColor : cursorColor,
      obscureText: obSecure!,
      textCapitalization: widget.textCapitalization!,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      focusNode: widget.focusNode,
      maxLines: widget.maxLine,
      style: TextStyle(
        color: (appBrightness == Brightness.dark) ? textDarkColor : textColor,
        fontSize: font14
      ),
      initialValue: widget.defaultText,
      decoration: InputDecoration(
        errorText: widget.errorMessage,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showSuffixIcon!
            ? (obSecure!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obSecure = false;
                      });
                    },
                    icon: Icon(Icons.visibility_off,
                        size: 22,
                        color: (appBrightness == Brightness.dark)
                            ? hoverColorDarkColor
                            : hoverColorDarkColor))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        obSecure = true;
                      });
                    },
                    icon: Icon(Icons.visibility,
                        size: 22,
                        color: (appBrightness == Brightness.dark)
                            ? hoverColorDarkColor
                            : hoverColorDarkColor)))
            : null,
        label: Text(
          "${widget.hintText}",
          style: AppThemes.lightTheme.textTheme.labelMedium

          /*TextStyle(
              color: (appBrightness == Brightness.dark)
                  ? labelDarkColor
                  : labelColor)*/,
        ),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: (appBrightness == Brightness.dark)
                    ? enableBorderDarkColor
                    : enableBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: (appBrightness == Brightness.dark)
                    ? focusedBorderDarkColor
                    : focusedBorderColor)),
        hintStyle: const TextStyle(
          color: textColor,
          fontSize: font14
        ),
        contentPadding: EdgeInsets.only(
            top: font12, bottom: bottomPaddingToError, left: 8.0, right: 8.0),
        isDense: true,
        errorStyle: const TextStyle(
          color: errorColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
      ),
      onChanged: (String value) {
        _onChanged(value);
      },
      controller: widget.controller,
      validator: (value) {
        if (widget.functionValidate != null) {
          String resultValidate =
              widget.functionValidate!(value, widget.parametersValidate);
          return resultValidate;
        }
        return null;
      },
      onFieldSubmitted: (value) {
        if (widget.onSubmitField != null) widget.onSubmitField!();
      },
      onTap: () {
        if (widget.onFieldTap != null) widget.onFieldTap!();
      },
    );
  }

  void _setInputLength(int length) {
    setState(() {
      inputLength = length;
    });
  }

  _onChanged(String value) {
    _setInputLength(value != AppConstants.emptyString ? value.length : 0);
    if (widget.onChange != null) widget.onChange!(value);
  }
}

commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(BuildContext context, FocusNode currentFocus,
    FocusNode passwordFocus, FocusNode confirmPasswordFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(passwordFocus);
}
