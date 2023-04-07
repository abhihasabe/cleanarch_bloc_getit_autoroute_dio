import 'package:bloc_clean/core/localization/model/language_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  const LanguageState({Language? selectedLanguage, ThemeMode? themeMode})
      : selectedLanguage = selectedLanguage ?? Language.english,
        themeMode = themeMode ?? ThemeMode.light;

  final Language selectedLanguage;
  final ThemeMode themeMode;

  @override
  List<Object> get props => [selectedLanguage, themeMode];

  LanguageState copyWith({Language? selectedLanguage, ThemeMode? themeMode}) {
    return LanguageState(
        selectedLanguage: selectedLanguage ?? this.selectedLanguage,
        themeMode: themeMode ?? this.themeMode);
  }
}
