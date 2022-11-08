import 'package:flutter/material.dart';
import 'package:sound_share/ui/screens/splash/splash_screen.dart';
import 'package:sound_share/ui/style/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundShare',
      theme: ThemeData(
          buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      )),
      home: const SplashScreen(),
    );
  }
}
