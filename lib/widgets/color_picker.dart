import 'package:flutter/material.dart';

class CustomColorPicker extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  ColorSwatch value = Colors.blue;

  CustomColorPicker(
      {@required this.onPressed, @required this.icon, @required this.value});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Theme.of(context).accentColor, size: 30),
            CircleAvatar(
              backgroundColor: value,
              radius: 35.0,
              child: const Text("MAIN"),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Pick Color",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
