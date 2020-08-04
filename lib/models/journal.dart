// MODEL CLASS FOR JOURNAL

import 'entry.dart';

class Journal {
  final String name;
  final List<Entry> entries;

  Journal({this.name = 'Journal', this.entries});

  int get numEntries => entries.length;
}