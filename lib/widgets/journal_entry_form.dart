import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dto.dart';

class JournalEntryForm extends StatefulWidget {

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: formBody(),
      ),
    );
  }

  Widget formBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        inputTextField('Title'),
        inputTextField('Body'),
        inputTextField('Rating'),
        formButtons()
      ],
    );
  }

  Widget inputTextField(fieldTitle) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: fieldTitle, 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.5,
              color: Colors.blue[300]
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.5,
              color: Colors.red[300]
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[100]
            )
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[100]
            )
          ),
        ),
        onSaved: (value) {
          if(fieldTitle == 'Title') { journalEntryFields.title = value; }
          if(fieldTitle == 'Body') { journalEntryFields.body = value; }
          if(fieldTitle == 'Rating') { journalEntryFields.rating = int.parse(value); }
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a $fieldTitle';
          } 
          else if (fieldTitle == 'Rating'){
            switch(int.parse(value)) {
              case 1:
              case 2:
              case 3:
              case 4: return null;
              default: return 'Please enter a Rating between 1 to 4';
            }
          }
          else {
            return null;
          }
        },
      )
    );
  }

  Widget formButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        saveButton(formKey),
        cancelButton()
      ]
    );
  }

  Widget saveButton(formKey) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
        onPressed: () async {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            addDateToEntry();
            // await deleteDatabase('journal.db');     // DELETE ME
            // var db = await openDatabase('journal.db');
            final databaseManager = DatabaseManager.getInstance();
            databaseManager.saveJournalEntry(dto: journalEntryFields);
            pushJournalEntriesScreen(context);
          }
        },
        child: Text('Save Entry')
      )
    );
  }

  void addDateToEntry() {
    journalEntryFields.date =  DateTime.now().toIso8601String();
  }

  void pushJournalEntriesScreen(BuildContext context) {
    Navigator.of(context).pushNamed('journal');
  }

  Widget cancelButton() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
        onPressed: () {
            Navigator.of(context).pop();
        },
        child: Text('Cancel')
      )
    );
  }
}