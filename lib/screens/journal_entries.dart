import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_entry_list_display.dart';
import '../widgets/settings_drawer.dart';

class JournalEntries extends StatelessWidget {

  static final routeName = 'journal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entries'),
      ),
      endDrawer: SettingsDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushNewEntryScreen(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        ),
        body: JournalEntryListDisplay(),
      
    );
  }

  void pushNewEntryScreen(BuildContext context) {
    Navigator.of(context).pushNamed('newEntry');
  }
}