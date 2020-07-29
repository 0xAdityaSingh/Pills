import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/widgets/custom_date_time_picker.dart';
import 'package:pills/widgets/custom_modal_action_button.dart';
import 'package:pills/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  // String _selectedDate = 'Pick date';
  // String _selectedTime
  String name;
  String dose;
  // bool senior?;
  // int age;
  String time = 'Pick time';
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
        time: time ?? DateTime.now().toString(),
      ),
    );

    Navigator.pop(context);
  }
  // Future _pickDate() async {
  //   DateTime datepick = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //       firstDate: new DateTime.now().add(Duration(days: -365)),
  //       lastDate: new DateTime.now().add(Duration(days: 365)));
  //   if (datepick != null)
  //     setState(() {
  //       _selectedDate = datepick.toString();
  //     });
  // }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timepick != null) {
      setState(() {
        time = timepick.toString();
        // _selectedTime = timepick.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add New Medecine",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 24,
          ),
          TextField(
            // controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Name"),
            onChanged: (v) {
              setState(
                () {
                  name = v;
                },
              );
            },
          ),

          SizedBox(height: 12),
          TextField(
            // controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                labelText: "Dose"),
            onChanged: (v) {
              setState(
                () {
                  dose = v;
                },
              );
            },
          ),
          SizedBox(height: 12),
          // CustomDateTimePicker(
          //   icon: Icons.date_range,
          //   onPressed: _pickDate,
          //   value: _selectedDate,
          // ),
          CustomDateTimePicker(
            icon: Icons.access_time,
            onPressed: _pickTime,
            value: time,
          ),
          SizedBox(
            height: 24,
          ),
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              _addContact(context);
            },
          )
        ],
      ),
    );
  }
}
