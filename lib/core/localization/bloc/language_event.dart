import 'package:bloc_clean/core/localization/model/language_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.selectedLanguage});

  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}

class ChangeTheme extends LanguageEvent {
  const ChangeTheme({required this.selectedTheme});

  final ThemeMode selectedTheme;

  @override
  List<Object> get props => [selectedTheme];
}

class GetThemeAndLang extends LanguageEvent {}
