import 'package:bloc_clean/src/widgets/text_widget.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'logo_widget.dart';

class ToolbarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final VoidCallback? onClick;
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final Color? color;
  final double? elevation;
  final bool? logoWidget;
  final bool? hideBackArrow;

  const ToolbarWidget(
      {Key? key,
      this.onClick,
      this.hideBackArrow,
      this.logoWidget,
      this.leading,
      this.title,
      this.actions,
      this.color,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    return AppBar(
        backgroundColor: (brightness == Brightness.dark)
            ? appBarBackgroundDarkColor
            : appBarBackgroundColor,
        automaticallyImplyLeading: hideBackArrow == true ? false : true,
        title: logoWidget == true
            ? const Center(child: LogoWidget(header: true, small: true))
            : TextWidget(
                text: title,
                title: true,
                bold: true,
                textColor: (brightness == Brightness.dark)
                    ? appBarTextDarkColor
                    : appBarTextColor,
              ),
        leading: InkWell(onTap: onClick, child: leading),
        actions: actions,
        elevation: elevation ?? 0.0);
  }
}
