import 'package:bloc_clean/core/manager/platform_manager.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_font_size.dart';
import 'package:flutter/material.dart';
import 'modal_widget.dart';
import 'text_widget.dart';

class DropdownWidget extends StatelessWidget {
  final BuildContext? context;
  final String? value;
  final String? hintText;
  final Function? onChoose;
  final Widget? prefixIcon;
  final String? label;
  final List<String>? items;
  final String? errorMessage;
  final FocusNode? autofocus;
  final TextInputAction? actionKeyboard;

  const DropdownWidget(
      {Key? key,
      @required this.context,
      this.autofocus,
      this.value,
      this.onChoose,
      this.label,
      this.items,
      this.hintText,
      this.prefixIcon,
      this.errorMessage,
      this.actionKeyboard = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    dynamic brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    List<Widget> options = [];

    if (value != null) controller.text = value!;

    if (items != null && items!.isNotEmpty) {
      items!.asMap().entries.map((
        i,
      ) {
        options.add(SizedBox(
          width: PlatFormManager.isMobile(context)
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width - 350,
          child: ListTile(
            onTap: () {
              controller.text = i.value;
              if (onChoose != null) onChoose!(i.value, i.key);
              Navigator.pop(context);
            },
            //status: _controller.text == i ? true : false,
            title: TextWidget(text: i.value),
          ),
        ));
      }).toList();
    } else {
      options.add(SizedBox(
        width: PlatFormManager.isMobile(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width - 350,
        child: const ListTile(title: TextWidget(text: "Data Not Found")),
      ));
    }

    return TextFormField(
        focusNode: autofocus,
        textInputAction: actionKeyboard,
        controller: controller,
        onChanged: (value) => value,
        enableInteractiveSelection: false,
        cursorColor:
            (brightness == Brightness.dark) ? cursorDarkColor : cursorColor,
        onTap: () {
          ModalWidget.show(context,
              title: label == null ? "" : label!.toUpperCase(),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[...options]));
        },
        textCapitalization: TextCapitalization.none,
        readOnly: true,
        style: TextStyle(
          color: (brightness == Brightness.dark) ? textDarkColor : textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w200,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        decoration: InputDecoration(
          errorText: errorMessage,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            icon: Icon(Icons.arrow_drop_down,
                size: 18,
                color: (brightness == Brightness.dark)
                    ? hoverColorDarkColor
                    : hoverColorDarkColor),
            onPressed: () {},
          ),
          label: Text(
            hintText!,
            style: TextStyle(
                color: (brightness == Brightness.dark)
                    ? labelDarkColor
                    : labelColor),
          ),
          hintText: hintText ?? "",
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (brightness == Brightness.dark)
                      ? enableBorderDarkColor
                      : enableBorderColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (brightness == Brightness.dark)
                      ? enableBorderDarkColor
                      : enableBorderColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (brightness == Brightness.dark)
                      ? focusedBorderDarkColor
                      : focusedBorderColor)),
          hintStyle: const TextStyle(
              fontSize: fontInputWidget,
              color: backgroundDarkColor,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2),
          isDense: true,
          contentPadding: const EdgeInsets.only(
              top: font12, bottom: font12, left: 8.0, right: 8.0),
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
        ));
  }
}
