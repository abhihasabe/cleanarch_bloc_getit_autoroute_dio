import 'package:bloc_clean/core/localization/model/language_model.dart';
import 'package:bloc_clean/core/localization/bloc/language_event.dart';
import 'package:bloc_clean/core/localization/bloc/language_bloc.dart';
import 'package:bloc_clean/core/localization/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<LanguageBloc>().add(
                        ChangeLanguage(selectedLanguage: Language.values[0]));
                    setState(() {});
                  },
                  child: Text(
                      AppLocalization.of(context)?.translate('english') ??
                          "English",
                      style: Theme.of(context).textTheme.headline3)),
            ),
            const SizedBox(height: 22),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<LanguageBloc>().add(
                        ChangeLanguage(selectedLanguage: Language.values[1]));
                    setState(() {});
                  },
                  child: Text(
                      AppLocalization.of(context)?.translate('hindi') ??
                          "Hindi",
                      style: Theme.of(context).textTheme.headline3)),
            ),
            const SizedBox(height: 22),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<LanguageBloc>()
                        .add(const ChangeTheme(selectedTheme: ThemeMode.light));
                    setState(() {});
                  },
                  child: Text(
                      AppLocalization.of(context)?.translate('light') ??
                          "Light",
                      style: Theme.of(context).textTheme.headline3)),
            ),
            const SizedBox(height: 22),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<LanguageBloc>()
                        .add(const ChangeTheme(selectedTheme: ThemeMode.dark));
                    setState(() {});
                  },
                  child: Text(
                      AppLocalization.of(context)?.translate('dark') ??
                          "Dark",
                      style: Theme.of(context).textTheme.headline3)),
            ),
          ]),
    );
  }
}
