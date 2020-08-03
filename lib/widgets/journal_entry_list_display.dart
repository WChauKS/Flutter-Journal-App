import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../models/entry.dart';
import '../models/journal.dart';

// DELETE ME
// final Journal fakeJournal = Journal(name: 'Journal',
//   entries: [
//     Entry(id: 1, title: 'Fake1', body: 'Bod1', rating: 1),
//     Entry(id: 1, title: 'Fake2', body: 'Bod2', rating: 2),
//     Entry(id: 1, title: 'Fake3', body: 'Bod3', rating: 3),
//     Entry(id: 1, title: 'Fake4', body: 'Bod4', rating: 4),
//   ]
// );

class JournalEntryListDisplay extends StatefulWidget {
  @override
  _JournalEntryListDisplayState createState() => _JournalEntryListDisplayState();
}

class _JournalEntryListDisplayState extends State<JournalEntryListDisplay> {
  Journal journal;

  @override
  void initState() {
    super.initState();
    loadJournal();
    // journal = fakeJournal;
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    // journal = fakeJournal;
    List<Entry> entries = await databaseManager.journalEntries();
    // print('Journal Records: ' + journalRecords.toString());
    // print(entries[0].title);
    setState(() {
      journal = Journal(entries: entries);
    });
  }
  @override
  Widget build(BuildContext context) {
    if(journal == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading'),
            Center(child: CircularProgressIndicator())
          ]
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: journal.numEntries,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(journal.entries[index].title),
          subtitle: Text(journal.entries[index].body),
        );
      },
    );
    // return Text('Placeholder');
  }
}