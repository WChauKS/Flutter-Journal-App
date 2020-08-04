import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'db/database_manager.dart';
import 'widgets/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  await DatabaseManager.initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeData theme = (prefs.getBool('isDark') ?? false) ? darkMode: lightMode;
  print(prefs.getBool('isDark'));
  runApp(ThemeSwitcherWidget(initTheme: theme, child: App()));
}