import 'package:bloc_clean/src/features/home/presentation/widget/home_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean/src/features/setting/presentation/widget/setting_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingWidget();
  }
}