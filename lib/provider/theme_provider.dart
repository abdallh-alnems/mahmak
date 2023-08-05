import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
ThemeMode themeMode = ThemeMode.dark;

setThemeFromLocal() async {
final pref = await SharedPreferences.getInstance();
bool isDark = pref.getBool('isDark') ?? false;
toggleTheme(isDark);
}

bool get isDarkMode => themeMode == ThemeMode.dark;

void toggleTheme(bool isOn) {
themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
notifyListeners();
}
}

class MyTheme {
static final darkTheme = ThemeData(
scaffoldBackgroundColor: Colors.white,
colorScheme: const ColorScheme.dark(),
primaryColor: const Color.fromRGBO(25, 25, 25, 1),
iconTheme:
const IconThemeData(color: Color.fromRGBO(65, 63, 66, 1), opacity: 1),
secondaryHeaderColor: Colors.white,
fontFamily: 'Vazirmatn');

static final lightTheme = ThemeData(
scaffoldBackgroundColor: Colors.white,
colorScheme: const ColorScheme.light(),
primaryColor: Colors.white,
iconTheme: const IconThemeData(
color: Color.fromRGBO(212, 144, 112, 1), opacity: 1),
secondaryHeaderColor: Colors.grey[700],
fontFamily: 'Vazirmatn');
}