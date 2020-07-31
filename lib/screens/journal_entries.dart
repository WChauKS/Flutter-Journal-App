import 'package:flutter/material.dart';
import '../widgets/settings_drawer.dart';


class JournalEntries extends StatelessWidget {

  static final routeName = 'journal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entries'),
      ),
      drawer: SettingsDrawer(),
      body: SingleChildScrollView(
        child: Text('List goes here...'),
      )
    );
  }
}