import 'package:bloc_clean/core/localization/app_localization.dart';
import 'package:bloc_clean/core/manager/app_router_manager.gr.dart';
import 'package:bloc_clean/src/widgets/input_field_widget.dart';
import 'package:bloc_clean/src/widgets/button_widget.dart';
import 'package:bloc_clean/src/widgets/logo_widget.dart';
import 'package:bloc_clean/src/widgets/text_widget.dart';
import 'package:bloc_clean/core/theme/app_colors.dart';
import 'package:bloc_clean/core/theme/app_dimens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  dynamic appTheme;

  bool get isPopulated =>
      _nameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _mobileController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

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
      height: MediaQuery.of(context).size.height * 0.60,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTitleWidget(),
                  const SizedBox(height: dimension20),
                  InputTextFormFieldWidget(
                    key: const Key("nameKey"),
                    maxLine: one,
                    controller: _nameController,
                    hintText: AppLocalization.of(context)?.translate('name'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.emailAddress,
                    actionKeyboard: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: hoverColorDarkColor,
                    ),
                    /*errorMessage: state.email.invalid
                                ? AppLocalization.of(context)?.translate('peveid')
                                : null,*/
                    onChange: (name) =>
                    name /*context.read<LoginCubit>().emailChanged(name)*/,
                    parametersValidate:
                    AppLocalization.of(context)?.translate('pen'),
                  ),
                  const SizedBox(height: dimension12),
                  InputTextFormFieldWidget(
                    key: const Key("mobileKey"),
                    controller: _mobileController,
                    hintText:
                    AppLocalization.of(context)?.translate('mobile'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.number,
                    actionKeyboard: TextInputAction.next,
                    maxLine: one,
                    prefixIcon:
                    const Icon(Icons.lock, color: hoverColorDarkColor),
                    /*errorMessage: state.password.invalid
                                ? AppLocalization.of(context)?.translate('pepass')
                                : null,*/
                    onChange: (name) =>
                    name /*context.read<LoginCubit>().passwordChanged(name)*/,
                    parametersValidate:
                    AppLocalization.of(context)?.translate('pem'),
                  ),
                  const SizedBox(height: dimension12),
                  InputTextFormFieldWidget(
                    key: const Key("emailKey"),
                    controller: _emailController,
                    hintText:
                    AppLocalization.of(context)?.translate('email'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.emailAddress,
                    actionKeyboard: TextInputAction.next,
                    maxLine: one,
                    prefixIcon:
                    const Icon(Icons.lock, color: hoverColorDarkColor),
                    /*errorMessage: state.password.invalid
                                ? AppLocalization.of(context)?.translate('pepass')
                                : null,*/
                    onChange: (name) =>
                    name /*context.read<LoginCubit>().passwordChanged(name)*/,
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
                    actionKeyboard: TextInputAction.next,
                    obscureText: true,
                    showSuffixIcon: true,
                    maxLine: one,
                    suffixIcon: const Icon(Icons.visibility,
                        color: hoverColorDarkColor),
                    prefixIcon:
                    const Icon(Icons.lock, color: hoverColorDarkColor),
                    /*errorMessage: state.password.invalid
                                ? AppLocalization.of(context)?.translate('pepass')
                                : null,*/
                    onChange: (name) =>
                    name /*context.read<LoginCubit>().passwordChanged(name)*/,
                    parametersValidate:
                    AppLocalization.of(context)?.translate('pep'),
                  ),
                  const SizedBox(height: dimension12),
                  InputTextFormFieldWidget(
                    key: const Key("confirmPasswordKey"),
                    controller: _confirmPasswordController,
                    hintText:
                    AppLocalization.of(context)?.translate('confirmPassword'),
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
                    /*errorMessage: state.password.invalid
                                ? AppLocalization.of(context)?.translate('pepass')
                                : null,*/
                    onChange: (name) =>
                    name /*context.read<LoginCubit>().passwordChanged(name)*/,
                    parametersValidate:
                    AppLocalization.of(context)?.translate('pecp'),
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
                      context.replaceRoute(const Login());
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
                  buildSignUpText()
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: AppLocalization.of(context)?.translate('aHaveAccount'),
          small: true,
          textColor: (appTheme == Brightness.dark) ? textDarkColor : textColor,
        ),
        const SizedBox(width: dimension5),
        InkWell(
          onTap: () {
            context.replaceRoute(const Login());
          },
          child: TextWidget(
            text: AppLocalization.of(context)?.translate('signIn'),
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
      text: AppLocalization.of(context)?.translate('signUp'),
      big: true,
      bold: true,
      textColor:
          (appTheme == Brightness.dark) ? primaryDarkColor : primaryColor,
    );
  }
}