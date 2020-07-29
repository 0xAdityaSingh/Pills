import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/contactData.dart';
import 'package:pills/pages/add_event_page.dart';
import 'package:pills/widgets/contactList.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ContactData>(context, listen: false).getContacts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Expanded(
            //   child: Center(
            //     child: Text(
            //       "Pills",
            //       style: GoogleFonts.balooDa(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.grey.shade800),
            //     ),
            //   ),
            // ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.lightGreenAccent,
      //   elevation: 16.0,
      //   title: Text(
      //     'Associates',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                buildPadding("MY MEDECINE"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                child: AddEventPage(),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))));
                          });
                      // _modalBottomSheetMenu();
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: ContactList(),
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     buildPadding("AFTERNOON"),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.add,
            //           size: 30,
            //           color: Colors.blue,
            //         ),
            //         onPressed: () {
            //           showDialog(
            //               barrierDismissible: false,
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return Dialog(
            //                     child: AddEventPage(),
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(12))));
            //               });
            //           // _modalBottomSheetMenu();
            //         },
            //       ),
            //     )
            //   ],
            // ),
            // Expanded(
            //   child: Container(
            //     child: ContactList(),
            //   ),
            // ),
            // Row(
            //   children: <Widget>[
            //     buildPadding("EVENING"),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.add,
            //           size: 30,
            //           color: Colors.blue,
            //         ),
            //         onPressed: () {
            //           showDialog(
            //               barrierDismissible: false,
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return Dialog(
            //                     child: AddEventPage(),
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(12))));
            //               });
            //           // _modalBottomSheetMenu();
            //         },
            //       ),
            //     )
            //   ],
            // ),
            // Expanded(
            //   child: Container(
            //     child: ContactList(),
            //   ),
            // ),
            // Row(
            //   children: <Widget>[
            //     buildPadding("NIGHT"),
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.add,
            //           size: 30,
            //           color: Colors.blue,
            //         ),
            //         onPressed: () {
            //           showDialog(
            //               barrierDismissible: false,
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return Dialog(
            //                     child: AddEventPage(),
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(12))));
            //               });
            //           // _modalBottomSheetMenu();
            //         },
            //       ),
            //     )
            //   ],
            // ),
            // Expanded(
            //   child: Container(
            //     child: ContactList(),
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // backgroundColor: Colors.lightGreenAccent,
      //   tooltip: "Add",
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     showDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (BuildContext context) {
      //           return Dialog(
      //               child: AddEventPage(),
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(12))));
      //         });
      //   },
      // ),
    );
  }

  Expanded buildPadding(String abc) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text(
          abc,
          style: GoogleFonts.balooDa(
              fontSize: 30,
              // fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
