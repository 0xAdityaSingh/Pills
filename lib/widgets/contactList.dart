import 'package:flutter/material.dart';
import 'package:pills/contactData.dart';
import 'package:pills/widgets/contactTile.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  final String maed;

  // ContactList(this.maed);
  const ContactList({Key key, this.maed});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ContactTile(
          tileIndex: index,
          maed: maed,
        );
      },
      itemCount: Provider.of<ContactData>(context).contactCount,
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
    );
  }
}
