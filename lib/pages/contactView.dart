import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/pages/contactEdit.dart';
import 'package:pills/utils.dart';
import 'package:provider/provider.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _deleteConfirmation(currentContact) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Are you sure?',
              style: TextStyle(color: Colors.black),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You are about to delete ${currentContact.name}'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("This action cannot be undone")
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "DELETE",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Log.d("Deleting ${currentContact.name}");
                  Provider.of<ContactData>(context, listen: false)
                      .deleteContact(currentContact.key);

                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Navigator.defaultRouteName),
                  );
                },
              ),
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Log.d("Cancelling");
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        Contact currentContact = contactData.getActiveContact();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            elevation: 16.0,
            title: Text(
              currentContact?.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.create),
                iconSize: 24.0,
                color: Colors.blue,
                tooltip: "Edit",
                onPressed: () {
                  Log.d("Selected to edit");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ContactEditPage(currentContact: currentContact);
                    },
                  ));
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.red,
                tooltip: "Delete",
                onPressed: () {
                  Log.d("Selected for deletion");
                  _deleteConfirmation(currentContact);
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Dose",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentContact?.dose.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Time",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentContact?.time,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
