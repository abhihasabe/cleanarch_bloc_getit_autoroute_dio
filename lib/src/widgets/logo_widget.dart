import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool? header;
  final bool? small;
  final bool? challenge;

  const LogoWidget({Key? key, this.challenge, this.small, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logo = const AssetImage("assets/images/logo.png");
    var logoHeader = const AssetImage("assets/images/logo_header.png");
    var logoDark = const AssetImage("assets/images/logo_dark.png");

    final finalLogoWidget = header == true
        ? challenge == true
            ? logoDark
            : logoHeader
        : challenge == true
            ? logoDark
            : logo;
    return Image(
      image: finalLogoWidget,
      width: small == true
          ? 100
          : header == true
              ? 100
              : 220,
      //fit: BoxFit.contain,
    );
  }
}
