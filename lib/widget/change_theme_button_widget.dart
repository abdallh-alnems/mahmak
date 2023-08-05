import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/provider/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
const ChangeThemeButtonWidget({super.key});

void setPrefThemeMode(bool isDark) async {
final pref = await SharedPreferences.getInstance();
pref.remove('isDark');
pref.setBool('isDark', isDark);
}

@override
Widget build(BuildContext context) {
final themeProvider = Provider.of<ThemeProvider>(context);


return Switch.adaptive(
value: themeProvider.isDarkMode,
activeColor: const Color.fromRGBO(212, 144, 112, 1),
onChanged: (value) {
final provider = Provider.of<ThemeProvider>(context, listen: false);
setPrefThemeMode(value);
provider.toggleTheme(value);
},
);
}
} 