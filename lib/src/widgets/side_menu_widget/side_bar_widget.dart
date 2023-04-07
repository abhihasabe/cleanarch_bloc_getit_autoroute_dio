import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean/core/manager/app_router_manager.gr.dart';
import 'package:bloc_clean/core/manager/platform_manager.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AdminSideMenu extends StatelessWidget {
  const AdminSideMenu(
      {Key? key, this.permanentlyDisplay, this.bgColor, this.textColor})
      : super(key: key);

  final Color? bgColor, textColor;
  final bool? permanentlyDisplay;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        children: [
          if (PlatFormManager.isMobile(context))
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          SideMenuItem(
              title: "Dashboard",
              imgSrc: "assets/images/leave.png",
              press: () {
                //VxNavigator.of(context).push(Uri.parse(adminHomeScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Company",
              imgSrc: "assets/images/profile.png",
              press: () {
                //VxNavigator.of(context).push(Uri.parse(adminCompanyScreen));
              },
              textColor: textColor),
          SideMenuItem(
              title: "Setting",
              imgSrc: "assets/images/projects.png",
              press: () {
                context.replaceRoute(const Setting());
              },
              textColor: textColor)
        ],
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem(
      {Key? key,
      this.title,
      this.imgSrc,
      this.press,
      this.textColor,
      this.selectedTileColor})
      : super(key: key);

  final String? title, imgSrc;
  final VoidCallback? press;
  final Color? textColor, selectedTileColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selectedTileColor: disabledTextColor,
          onTap: press,
          horizontalTitleGap: 0.0,
          minVerticalPadding: 10,
          leading: imgSrc != null
              ? Image.asset(
                  imgSrc ?? "",
                  color: textColor,
                  height: 16,
                )
              : Container(),
          title: Text(
            title!,
            style: TextStyle(color: textColor),
          ),
        ),
        const Divider(
          height: 1,
          color: enableBorderColor,
        )
      ],
    );
  }
}
