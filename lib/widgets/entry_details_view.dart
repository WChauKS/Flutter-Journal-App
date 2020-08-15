import 'package:flutter/material.dart';
import '../models/entry.dart';
import '../utility/format_date.dart';

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
                Expanded(child: Text(entry.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                // Spacer(),
                Expanded(child: Text('Date: ' + formatDate(entry.date, 1)))
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
                Expanded(child: Text(entry.body, style: TextStyle(fontSize: 20))),
              ]
            )
          ],
        ),
      );
  }
}