import 'package:bloc_clean/src/features/home/presentation/widget/home_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean/src/widgets/side_menu_widget/side_bar_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home", style: Theme.of(context).textTheme.titleMedium),
        ),
        drawer: const AdminSideMenu(),
        body: const HomeWidget());
  }
}
