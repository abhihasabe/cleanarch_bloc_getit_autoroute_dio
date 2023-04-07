import 'package:bloc_clean/core/localization/model/language_model.dart';
import 'package:bloc_clean/core/localization/bloc/language_state.dart';
import 'package:bloc_clean/core/localization/bloc/language_event.dart';
import 'package:bloc_clean/core/constants/app_cache_constant.dart';
import 'package:bloc_clean/core/manager/cache_manager.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<ChangeTheme>(onChangeTheme);
    on<GetThemeAndLang>(onGetThemeAndLang);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    await locator.get<CacheManager>().request(
        cacheName: CacheConstants.cacheName,
        method: CacheConstants.setString,
        key: CacheConstants.lang,
        value: event.selectedLanguage.value.languageCode);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onChangeTheme(ChangeTheme event, Emitter<LanguageState> emit) async {
    await locator.get<CacheManager>().request(
        cacheName: CacheConstants.cacheName,
        method: CacheConstants.setString,
        key: CacheConstants.theme,
        value: event.selectedTheme.name);
    emit(state.copyWith(themeMode: event.selectedTheme));
  }

  onGetThemeAndLang(GetThemeAndLang event, Emitter<LanguageState> emit) async {
    await locator
        .get<CacheManager>()
        .request(
            cacheName: CacheConstants.cacheName,
            method: CacheConstants.getString,
            key: CacheConstants.theme)
        .then((selectedTheme) async {
      await locator
          .get<CacheManager>()
          .request(
              cacheName: CacheConstants.cacheName,
              method: CacheConstants.getString,
              key: CacheConstants.lang)
          .then((selectedLanguage) {
        print("selectedTheme: $selectedTheme");
        print("selectedLanguage: $selectedLanguage");
        emit(state.copyWith(
            selectedLanguage: selectedLanguage != null
                ? Language.values
                    .where(
                        (item) => item.value.languageCode == selectedLanguage)
                    .first
                : Language.english,
            themeMode: selectedTheme == "dark"
                ? ThemeMode.dark
                : ThemeMode.light ?? ThemeMode.light));
      });
    });
  }
}
