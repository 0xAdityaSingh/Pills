import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/pages/contactList.dart';
import 'package:pills/pages/page.dart';

class Delay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DelayState();
}

class DelayState extends State<Delay> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1000);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ContactListPage()));
    // context, MaterialPageRoute(builder: (context) => MPage()));
  }

  initScreen(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Pills',
            // style: GoogleFonts.galada()
            style: GoogleFonts.lobster(
              fontSize: 60,
              // fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
