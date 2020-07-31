import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDrawer extends StatefulWidget {
  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {

  bool isDark = false;

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
            SwitchListTile(
              title: Text('Dark Mode'),
              value: isDark,
              onChanged: (theme) => changeDarkMode(),
            )
            // ListTile(title: Text('DarkMode')),
          ]
        ),
      );
  }

  void changeDarkMode() async {
    setState( () {
      isDark = true;
    });
  }
}