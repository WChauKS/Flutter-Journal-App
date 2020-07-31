import 'package:flutter/material.dart';
import '../widgets/settings_drawer.dart';

class Welcome extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      endDrawer: SettingsDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushNewEntryScreen(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.book),
              iconSize: 100,
              tooltip: 'Go to Journal',
              onPressed: () => pushJournalEntriesScreen(context)),
            Text('Journal')
          ]
        ),
      )
    );
  }

  void pushNewEntryScreen(BuildContext context) {
    Navigator.of(context).pushNamed('newEntry');
  }

  void pushJournalEntriesScreen(BuildContext context) {
    Navigator.of(context).pushNamed('journal');
  }
}