import 'package:flutter/material.dart';
import 'package:journal/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Text('Settings'),
              margin: EdgeInsets.only(bottom: 0.0),
            ),
            ToggleDarkMode()
          ]
        ),
      );
  }
}

class ToggleDarkMode extends StatefulWidget {
  @override
  _ToggleDarkModeState createState() => _ToggleDarkModeState();
}

class _ToggleDarkModeState extends State<ToggleDarkMode> {

  bool isDark;

  void initState() {
    super.initState();
    initIsDark();
  }

  void initIsDark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool('isDark') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Dark Mode'),
      value: isDark,
      onChanged: (value) {
        switchTheme(value);
      },
    );
  }

  void switchTheme(bool value) async {
    setState(() {
      isDark = value;
      if(isDark){
        ThemeSwitcher.of(context).switchTheme(darkMode);
      } else {
        ThemeSwitcher.of(context).switchTheme(lightMode);
      }
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', value);
  }
}