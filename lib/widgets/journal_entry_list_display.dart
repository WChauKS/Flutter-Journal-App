import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../models/entry.dart';
import '../models/journal.dart';
import '../screens/entry_details.dart';
import '../utility/format_date.dart';
import 'entry_details_view.dart';

// followed https://www.youtube.com/watch?v=1i73KbI2Uhg as a guide for creating
// the master detail scaffold

class JournalEntryListDisplay extends StatefulWidget {
  @override
  _JournalEntryListDisplayState createState() => _JournalEntryListDisplayState();
}

class _JournalEntryListDisplayState extends State<JournalEntryListDisplay> {
  Journal journal;
  final selectedEntry = ValueNotifier<Entry>(null);

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    // journal = fakeJournal;
    List<Entry> entries = await databaseManager.journalEntries();
    setState(() {
      journal = Journal(entries: entries);
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width > 430){
      return Row(
        children: [
          Container(
            width: 250,
            child: journalEntryList((entry) {
              selectedEntry.value = entry;
            })
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: selectedEntry, 
              builder: (context, entry, child) {
                if(entry == null) {
                  return Center(child: Text('No Entry Selected'),);
                }
                else {
                  return EntryDetailsView(entry: entry)
    ;            }
              })
          )
        ],
      );
    }
    return journalEntryList((entry){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => EntryDetailsScreen(entry: entry)
        ));
    });
  }

  Widget journalEntryList(ValueChanged<Entry> onSelect) {
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
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 0),
      padding: EdgeInsets.all(8.0),
      itemCount: journal.numEntries,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(journal.entries[index].title),
          subtitle: Text(formatDate(journal.entries[index].date, 0)),
          onTap: () {
            return onSelect(journal.entries[index]);
          },
        );
      },
    );
  }
}