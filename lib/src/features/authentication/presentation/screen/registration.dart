import 'package:bloc_clean/src/features/authentication/presentation/widget/registration_widget.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bloc_clean/core/manager/app_router_manager.gr.dart';
import 'package:bloc_clean/core/helper/dialog.helper.dart';
import 'package:bloc_clean/core/helper/toast.helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';

@RoutePage()
class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: <SystemUiOverlay>[]);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state.status.isInProgress) {
        DialogHelper.showLoadingDialog(context);
      } else if (state.status.isSuccess) {
        context.replaceRoute(const Login());
      } else if (state.status.isFailure) {
        DialogHelper.dismissDialog(context);
        ToastHelper.showToast(context, "Unable to login", ToastGravity.BOTTOM);
      }
    }, builder: (context, state) {
      return SafeArea(child: RegistrationWidget(state: state));
    });
  }
}
