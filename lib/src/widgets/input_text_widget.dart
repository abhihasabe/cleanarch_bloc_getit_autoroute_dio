import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_font_size.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final bool? autofocus;
  final TextEditingController? value;
  final Function(dynamic)? onChange;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool? password;
  final bool? dark;
  final bool? multiline;
  final String? errorMessage;
  final String? labelText;
  final String? mask;
  final TextInputAction? actionKeyboard;

  const InputTextWidget(
      {Key? key,
      this.autofocus,
      this.value,
      this.errorMessage,
      this.onChange,
      this.placeholder,
      this.keyboardType,
      this.password,
      this.dark,
      this.multiline,
      this.labelText,
      this.mask,
      this.actionKeyboard})
      : super(key: key);

  @override
  InputTextWidgetState createState() => InputTextWidgetState();
}

class InputTextWidgetState extends State<InputTextWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: fieldSpace),
      child: TextField(
          controller: widget.value,
          obscureText: widget.password == true ? true : false,
          onChanged: (value) {
            if (widget.onChange != null) widget.onChange!(value);
          },
          textInputAction: widget.actionKeyboard,
          maxLines: widget.multiline == true ? null : 1,
          keyboardType: widget.multiline == true
              ? TextInputType.multiline
              : widget.keyboardType,
          style: TextStyle(
              color: widget.dark == false ? primaryColor : primaryDarkColor),
          autofocus: widget.autofocus == null ? false : true,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 4),
              hintText: widget.labelText ?? "Holder",
              labelText: widget.labelText ?? widget.placeholder,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.dark == false
                        ? Colors.white
                        : primaryColor, //cor da borda
                    width: 0.5),
              ),
              hintStyle: const TextStyle(
                  color: Colors.transparent, //cor do placeholder com foco
                  fontSize: fontInputWidget),
              enabled: true,
              labelStyle: TextStyle(
                  fontSize: fontInputWidget,
                  color: widget.dark == false
                      ? accentColor
                      : primaryColor //cor da label
                  ),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: accentColor,
                width: 0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.dark == false ? primaryColor : accentColor,
                      width: 1)))),
    );
  }
}
