import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  String name;
  String dose;
  // bool senior?;
  // int age;
  DateTime time;

  void _addContact(context) {
    // if (name == null) {
    //   toastWidget("Give entry a name");
    //   return;
    // }
    // if (name.length < 2) {
    //   toastWidget("Get a longer name");
    //   return;
    // }
    Provider.of<ContactData>(context, listen: false).addContact(
      Contact(
        name: name,
        dose: dose,
        // phone: phone ?? 0,
        // isSenior: senior ?? false,
        time: time ?? TimeOfDay.now(),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: Text(
          "Add Contact",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            iconSize: 24.0,
            color: Colors.blue,
            tooltip: "Save",
            onPressed: () {
              _addContact(context);
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      name = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Dose",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      dose = v;
                    },
                  );
                },
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // TextField(
              //   autofocus: true,
              //   keyboardType: TextInputType.numberWithOptions(decimal: false),
              //   decoration: InputDecoration(
              //     hintText: "Age",
              //   ),
              //   onChanged: (v) {
              //     setState(
              //       () {
              //         age = int.parse(v);
              //       },
              //     );
              //   },
              // ),
              // Row(
              //   children: <Widget>[
              //     Text(
              //       "Is Senior",
              //       style:
              //           TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              //     ),
              //     Switch(
              //       activeTrackColor: Colors.black,
              //       activeColor: Colors.blue,
              //       onChanged: (v) {
              //         setState(() {
              //           senior = v;
              //         });
              //       },
              //       value: senior ?? false,
              //     ),
              //   ],
              // ),
              Row(
                children: <Widget>[
                  Text(
                    "Time",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    tooltip: "Tap to open the date picker",
                    onPressed: () async {
                      final DateTime d = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime(2100),
                      );
                      if (d != null)
                        setState(
                          () {
                            time = d;
                          },
                        );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
