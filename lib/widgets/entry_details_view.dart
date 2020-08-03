import 'package:flutter/material.dart';
import '../models/entry.dart';

class EntryDetailsView extends StatelessWidget {
  final Entry entry;
  EntryDetailsView({this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(entry.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Date:' + entry.date.toIso8601String())
              ]
            ),
            Row(
              children: [
                Text('Rating: ' + entry.rating.toString()),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(entry.body, style: TextStyle(fontSize: 20)),
              ]
            )
          ],
        ),
      );
  }
}