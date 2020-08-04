import 'package:flutter/material.dart';
import 'screens/new_entry.dart';
import 'screens/welcome.dart';
import 'screens/journal_entries.dart';
import 'widgets/themes.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Journal',
        theme: ThemeSwitcher.of(context).curTheme,
        routes: App.routes
    );
  }
}