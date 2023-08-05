import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/controller/ad_controller.dart';
import 'package:to_do_list/controller/animation_controller.dart';
import 'package:to_do_list/controller/data_controller.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/provider/menu_item_provider.dart';
import 'package:to_do_list/provider/theme_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuItemProvider>(
            create: (contex) => MenuItemProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (contex) => ThemeProvider()..setThemeFromLocal()),
      ],
      builder: (context, _) {
        return MyApp();
      }));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
	final getAnimationController = Get.put(GetAnimationController());
	final dataController = Get.put(DataController());
  final adController = Get.put(AdController());
	@override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeProvider.themeMode,
      darkTheme: MyTheme.darkTheme,
      theme: MyTheme.lightTheme,
      home: const HomePage(),
    );
  }
}