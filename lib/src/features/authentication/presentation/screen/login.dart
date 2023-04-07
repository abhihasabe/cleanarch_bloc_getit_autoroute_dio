import 'package:bloc_clean/core/helper/dialog.helper.dart';
import 'package:bloc_clean/core/helper/toast.helper.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:bloc_clean/src/features/authentication/presentation/widget/login_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(child: LoginWidget(state: state));
        });
  }
}
