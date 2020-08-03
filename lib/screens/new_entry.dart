import 'package:flutter/material.dart';
import '../widgets/settings_drawer.dart';
import '../widgets/journal_entry_form.dart';

class NewEntry extends StatelessWidget {

  static final routeName = 'newEntry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a New Journal Entry'),
      ),
      endDrawer: SettingsDrawer(),
      body: SingleChildScrollView(
        child: JournalEntryForm(),
      )
    );
  }
}