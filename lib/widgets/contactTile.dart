import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/pages/contactView.dart';
import 'package:pills/utils.dart';
import 'package:provider/provider.dart';

class ContactTile extends StatelessWidget {
  final int tileIndex;
  final String maed;
  // static const color = const Color(0xffb74093);
  const ContactTile({Key key, this.tileIndex, this.maed});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        void _showSnackBar(BuildContext context, String s) {
          final snackBar = SnackBar(
            content: Text(s),
            duration: Duration(seconds: 1),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }

        Contact currentContact = contactData.getContact(tileIndex);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: (Container(
            decoration: BoxDecoration(
                // border: Border.all(
                //     // color: Colors.red[500],
                //     ),
                color: Color(int.parse(
                    currentContact?.color.toString().substring(6, 16))),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // color: Color(
            //     int.parse(currentContact?.color.toString().substring(6, 16))),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            // decoration: BoxDecoration(color: currentContact.color),
            child: ListTile(
              leading: Image.asset(
                "assets/images/pill_rounded.png",
                fit: BoxFit.contain,
                width: 25,
                height: 25,
                color: Color(int.parse(
                    currentContact?.maincolor.toString().substring(6, 16))),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                iconSize: 24.0,
                // color: Colors.red,
                tooltip: "Delete",
                onPressed: () {
                  _showSnackBar(context, "Deleted Successfully");
                  Log.d("Deleting ${currentContact.name}");
                  Provider.of<ContactData>(context, listen: false)
                      .deleteContact(currentContact.key);
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        currentContact?.name ?? "",
                        style: GoogleFonts.mukta(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            currentContact?.maed.toString() ?? "",
                            style: GoogleFonts.mukta(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            currentContact?.dose.toString() ?? "",
                            style: GoogleFonts.mukta(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      currentContact?.time?.substring(10, 15) ?? "",
                      style: GoogleFonts.mukta(
                        fontSize: 20.0,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Provider.of<ContactData>(context, listen: false)
                    .setActiveContact(currentContact.key);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ContactView();
                    },
                  ),
                );
              },
            ),
          )),
        );
      },
    );
  }
}
