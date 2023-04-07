import 'package:bloc_clean/core/localization/bloc/language_event.dart';
import 'package:bloc_clean/core/localization/bloc/language_state.dart';
import 'package:bloc_clean/core/localization/bloc/language_bloc.dart';
import 'package:bloc_clean/core/localization/app_localization.dart';
import 'package:bloc_clean/core/theme/app_theme.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloc_clean/di/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/manager/app_router_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init().whenComplete(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()..add(GetThemeAndLang())),
        BlocProvider(create: (context) => AuthenticationBloc()),
      ],
      child:
          BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
        return MaterialApp.router(
          title: 'Clean Architecture, Bloc Pattern & Auto Route',
          routerConfig: AppRouter().config(),
          debugShowCheckedModeBanner: false,
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          themeMode: state.themeMode,
          locale: state.selectedLanguage.value,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('es', ''), // Spanish, no country code
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      }),
    );
  }
}
