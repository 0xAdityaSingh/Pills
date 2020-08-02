import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/widgets/color_picker.dart';
import 'package:pills/widgets/custom_date_time_picker.dart';
import 'package:pills/widgets/custom_modal_action_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

// String abc = Colors.black.toString();

class AddEventPage extends StatefulWidget {
  final String text;
  AddEventPage({Key key, @required this.text}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState(text);
}

class _AddEventPageState extends State<AddEventPage> {
  // String _selectedDate = 'Pick date';
  // String _selectedTime
  String text;
  _AddEventPageState(this.text);
  String name;
  String dose;
  // bool senior?;
  // int age;
  String time = 'Pick time';

  // ColorSwatch color = Colors.blue;
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
          color: _mainColor[100].toString(),
          maincolor: _mainColor[800].toString(),
          maed: text),
    );

    Navigator.pop(context);
  }

  ColorSwatch _tempMainColor;

  Color _tempShadeColor;

  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
                setState(() => _shadeColor = _tempShadeColor);
              },
            ),
          ],
        );
      },
    );
  }

  void _openMainColorPicker() async {
    _openDialog(
      "Pick Color",
      MaterialColorPicker(
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
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
          // CustomColorPicker(
          //   icon: Icons.color_lens,
          //   value: color,
          //   onPressed: _openMainColorPicker,
          // ),
          // CircleAvatar(
          //   backgroundColor: _mainColor,
          //   radius: 35.0,
          //   child: const Text("MAIN"),
          // ),

          // IconButton()
          // OutlineButton(
          //   onPressed: _openMainColorPicker,
          //   child: const Text('Show main color picker'),
          // ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: _openMainColorPicker,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.color_lens,
                      color: Theme.of(context).accentColor, size: 30),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Pick Color",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: _mainColor,
                    radius: 12.0,
                    // child: const Text("MAIN"),
                  ),
                ],
              ),
            ),
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
