import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();

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

  Widget inputTextField(title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: title, 
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

        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a $title';
          } else {
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
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            Navigator.of(context).pop();
          }
        },
        child: Text('Save Entry')
      )
    );
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