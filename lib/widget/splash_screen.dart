import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/images/profile.png',
      ),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const HomePage(),
    );
  }
}
