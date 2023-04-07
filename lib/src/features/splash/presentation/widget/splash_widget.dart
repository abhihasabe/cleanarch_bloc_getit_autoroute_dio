import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean/core/manager/app_router_manager.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    Future.delayed(const Duration(seconds: 3), () async {
      context.replaceRoute(const Login());
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text("Splash",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))));
  }
}
