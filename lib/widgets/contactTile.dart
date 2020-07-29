import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/pages/contactView.dart';
import 'package:pills/utils.dart';
import 'package:provider/provider.dart';

class ContactTile extends StatelessWidget {
  final int tileIndex;

  const ContactTile({Key key, this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        void _showSnackBar(BuildContext context, String s) {
          final snackBar = SnackBar(
            content: Text(s),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }

        Contact currentContact = contactData.getContact(tileIndex);
        return (Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          // decoration: BoxDecoration(color: currentContact.color),
          child: ListTile(
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
                          fontSize: 20.0, color: Colors.grey.shade800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentContact?.dose.toString() ?? "",
                      style: GoogleFonts.mukta(
                        fontSize: 14.0,
                        color: Colors.grey.shade700,
                      ),
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
                        color: Colors.grey.shade700),
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
        ));
      },
    );
  }
}
