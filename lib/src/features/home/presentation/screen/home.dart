import 'package:bloc_clean/src/features/home/presentation/widget/home_widget.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_state.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_event.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:bloc_clean/core/helper/dialog.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadUserEvent());
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return HomeWidget(state: state.users);
            } else if (state is HomeErrorState) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text("Data Not Found",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    )
                  ]);
            }
            return DialogHelper.buildLoading();
          }),
    );
  }
}
