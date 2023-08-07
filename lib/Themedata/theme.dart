import 'package:flutter/material.dart';

class Themeprov extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isdarkmode => themeMode == ThemeMode.dark;

  void togglemode(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mythemes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(brightness: Brightness.light),
    appBarTheme: const AppBarTheme(elevation: 0, color: Colors.white),
    primaryColor: const Color.fromARGB(255, 147, 70, 159),
    useMaterial3: true,
    fontFamily: 'Audiowide',
  );

  static final darktheme = ThemeData(
      colorScheme: const ColorScheme.dark(brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(
          elevation: 0, color: Color.fromARGB(255, 35, 33, 33)),
      primaryColor: const Color.fromARGB(255, 147, 70, 159),
      useMaterial3: true,
      fontFamily: 'Audiowide',
      scaffoldBackgroundColor: const Color.fromARGB(255, 35, 33, 33));
}
