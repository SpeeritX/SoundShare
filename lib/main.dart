import 'package:flutter/material.dart';
import 'package:sound_share/domain/music/synchronization/play_synchronizer.dart';
import 'package:sound_share/ui/app_configuration_widget.dart';
import 'package:sound_share/ui/screens/splash/splash_screen.dart';
import 'package:sound_share/ui/style/theme/app_theme.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await PlaySynchronizer.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundShare',
      theme: AppTheme.lightTheme,
      home: const AppConfigurationWidget(
        child: SplashScreen(),
      ),
    );
  }
}
