import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:provider/provider.dart';

class ContactEditPage extends StatefulWidget {
  final Contact currentContact;

  const ContactEditPage({@required this.currentContact});

  @override
  _ContactEditPageState createState() => _ContactEditPageState();
}

class _ContactEditPageState extends State<ContactEditPage> {
  String newName;
  String newdose;
  String newtime;
  // int newAge;
  // DateTime newJoinDate;

  void _editContact(context) {
    // if (newName == null) {
    //   toastWidget("Give entry a name");
    //   return;
    // }
    // if (newName.length < 2) {
    //   toastWidget("Get a longer name");
    //   return;
    // }
    Provider.of<ContactData>(context, listen: false).editContact(
        contact: Contact(
          name: newName,
          dose: newdose ?? 0,
          // phone: newPhone ?? 0,
          // isSenior: newSenior ?? false,
          time: newtime ?? TimeOfDay.now().toString(),
        ),
        contactKey: widget.currentContact.key);

    Navigator.pop(context);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentContact.name;
    newName = widget.currentContact.name;

    _phoneController.text = widget.currentContact.dose.toString();
    newdose = widget.currentContact.dose;

    // _ageController.text = widget.currentContact.age.toString();
    // newAge = widget.currentContact.age;

    // newSenior = widget.currentContact.isSenior;

    newtime = widget.currentContact.time;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: Text(
          "Edit ${widget.currentContact.name}",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            iconSize: 24.0,
            color: Colors.blue,
            tooltip: "Save",
            onPressed: () {
              _editContact(context);
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
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newName = v;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Dose",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newdose = v;
                    },
                  );
                },
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // TextField(
              //   autofocus: true,
              //   controller: _ageController,
              //   keyboardType: TextInputType.numberWithOptions(decimal: false),
              //   decoration: InputDecoration(
              //     hintText: "Age",
              //   ),
              //   onChanged: (v) {
              //     setState(
              //       () {
              //         newAge = int.parse(v);
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
              //           newSenior = v;
              //         });
              //       },
              //       value: newSenior ?? false,
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
                    icon: Icon(Icons.access_time),
                    tooltip: "Tap to open the time picker",
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
                            newtime = TimeOfDay.now().toString();
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
