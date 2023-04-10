import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bloc_clean/core/manager/app_router_manager.gr.dart';
import 'package:bloc_clean/core/localization/app_localization.dart';
import 'package:bloc_clean/src/widgets/input_field_widget.dart';
import 'package:bloc_clean/src/widgets/button_widget.dart';
import 'package:bloc_clean/src/widgets/logo_widget.dart';
import 'package:bloc_clean/src/widgets/text_widget.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_dimens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, this.state}) : super(key: key);
  final AuthenticationState? state;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  dynamic appTheme;

  String? email, password;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    appTheme = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogo(),
                _buildContainer(),
              ]),
        ),
      ),
    );
  }

  _buildLogo() {
    return const LogoWidget(
      header: false,
      challenge: false,
      small: true,
    );
  }

  Widget _buildContainer() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width * 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          duration: const Duration(seconds: 30),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildTitleWidget(),
                    const SizedBox(height: dimension30),
                    InputTextFormFieldWidget(
                      key: const Key("emailKey"),
                      maxLine: one,
                      controller: _emailController,
                      hintText: AppLocalization.of(context)?.translate('email'),
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.emailAddress,
                      actionKeyboard: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: hoverColorDarkColor,
                      ),
                      errorMessage: widget.state!.email.isNotValid
                          ? AppLocalization.of(context)?.translate('pee')
                          : null,
                      onChange: (email) {
                        this.email = email;
                        context
                            .read<AuthenticationBloc>()
                            .add(EmailChanged(email: email));
                      },
                      parametersValidate:
                          AppLocalization.of(context)?.translate('pee'),
                    ),
                    const SizedBox(height: dimension12),
                    InputTextFormFieldWidget(
                      key: const Key("passwordKey"),
                      controller: _passwordController,
                      hintText:
                          AppLocalization.of(context)?.translate('password'),
                      textCapitalization: TextCapitalization.sentences,
                      textInputType: TextInputType.text,
                      actionKeyboard: TextInputAction.done,
                      obscureText: true,
                      showSuffixIcon: true,
                      maxLine: one,
                      suffixIcon: const Icon(Icons.visibility,
                          color: hoverColorDarkColor),
                      prefixIcon:
                          const Icon(Icons.lock, color: hoverColorDarkColor),
                      errorMessage: widget.state!.password.isNotValid
                          ? AppLocalization.of(context)?.translate('pep')
                          : null,
                      onChange: (password) {
                        this.password = password;
                        context
                            .read<AuthenticationBloc>()
                            .add(PasswordChanged(password: password));
                      },
                      parametersValidate:
                          AppLocalization.of(context)?.translate('pep'),
                    ),
                    const SizedBox(height: dimension25),
                    ElevatedButtonWidget(
                      key: const Key("buttonKey"),
                      width: double.infinity,
                      title: AppLocalization.of(context)?.translate('signIn'),
                      height: dimension42,
                      bTitleBold: true,
                      onClick: isPopulated
                          ? () {
                              context.read<AuthenticationBloc>().add(
                                  LoggedIn(email: email!, password: password!));
                            }
                          : null,
                      bgColor: (appTheme == Brightness.dark)
                          ? buttonBgColor
                          : buttonDarkBgColor,
                      textColor: (appTheme == Brightness.dark)
                          ? buttonDarkTextColor
                          : buttonTextColor,
                      disabledBgColor: (appTheme == Brightness.dark)
                          ? disabledDarkBgColor
                          : disabledBgColor,
                      disabledTextColor: (appTheme == Brightness.dark)
                          ? disabledTextDarkColor
                          : disabledTextColor,
                      bTitleS: true,
                      borderRadius: dimension5,
                    ),
                    const SizedBox(
                      height: dimension10,
                    ),
                    buildSignInText()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSignInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: AppLocalization.of(context)?.translate('dNotHaveAccount'),
          small: true,
          textColor: (appTheme == Brightness.dark) ? textDarkColor : textColor,
        ),
        const SizedBox(width: dimension5),
        InkWell(
          onTap: () {
            context.replaceRoute(const Registration());
          },
          child: TextWidget(
            text: AppLocalization.of(context)?.translate('signUp'),
            small: true,
            bold: true,
            textColor:
                (appTheme == Brightness.dark) ? primaryDarkColor : primaryColor,
          ),
        ),
      ],
    );
  }

  buildTitleWidget() {
    return TextWidget(
      key: const Key("titleKey"),
      text: AppLocalization.of(context)?.translate('signIn'),
      big: true,
      bold: true,
      textColor:
          (appTheme == Brightness.dark) ? primaryDarkColor : primaryColor,
    );
  }
}
