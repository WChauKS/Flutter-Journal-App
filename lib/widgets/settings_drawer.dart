import 'package:flutter/material.dart';
import 'package:journal/main.dart';
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

  bool isDark = false;

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
      title: Text('Dark Mode'),
      value: isDark,
      onChanged: (value) {
        setState(() {
          isDark = value;
          ThemeHandler(theme: darkMode);
          ThemeHandler.of(context);
        });
      },
    );
  }
}