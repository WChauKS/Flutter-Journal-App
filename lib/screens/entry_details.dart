import 'package:flutter/material.dart';
import '../widgets/entry_details_view.dart';
import '../models/entry.dart';
import '../widgets/settings_drawer.dart';

class EntryDetailsScreen extends StatelessWidget {
  final Entry entry;
  EntryDetailsScreen({this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      endDrawer: SettingsDrawer(),
      body: EntryDetailsView(entry: entry)
    );
  }
}