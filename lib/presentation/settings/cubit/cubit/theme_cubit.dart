import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateThemeMode(ThemeMode mode) {
    if (state != mode) {
      emit(mode);
    }
  }
}

extension ThemeModeExtension on ThemeMode {
  String get text {
    switch (this) {
      case ThemeMode.dark:
        return "Включена";
      case ThemeMode.light:
        return "Выключена";
      case ThemeMode.system:
        return "Системная";
    }
  }
}
