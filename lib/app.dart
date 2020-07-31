import 'package:flutter/material.dart';
import 'package:journal/screens/new_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome.dart';
import 'screens/journal_entries.dart';

class App extends StatefulWidget {

  static final routes = {
    Welcome.routeName: (context) => Welcome(),
    NewEntry.routeName: (context) => NewEntry(),
    JournalEntries.routeName: (context) => JournalEntries()
  };

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  ThemeData theme;

  void initState() {
    super.initState();
    theme = ThemeData.light();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Journal',
        theme: theme,
        routes: App.routes
    );
  }
}