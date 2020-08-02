import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/utils.dart';

class ContactData extends ChangeNotifier {
  static const String _boxName = "contactBox";

  List<Contact> _contact = [];

  Contact _activeContact;

  void getContacts() async {
    var box = await Hive.openBox<Contact>(_boxName);

    _contact = box.values.toList();

    notifyListeners();
  }

  void getContactsmaed(maed) async {
    var box = await Hive.openBox<Contact>(_boxName);
    int len = box.length;
    for (int i = 0; i < len; i++) {
      if (box.get(i).maed == "Morning") _contact.add(box.get(i));
      if (box.get(i).maed == "Evening") _contact.add(box.get(i));
      if (box.get(i).maed == "Afternoon") _contact.add(box.get(i));
      if (box.get(i).maed == "Night") _contact.add(box.get(i));
    }

    notifyListeners();
  }

  Contact getContact(index) {
    return _contact[index];
  }

  // Contact getContactAfternoon(index) {
  //   if (_contact[index].maed == "Afternoon") return _contact[index];
  // }

  // Contact getContactEvening(index) {
  //   if (_contact[index].maed == "Evening") return _contact[index];
  // }

  // Contact getContactNight(index) {
  //   if (_contact[index].maed == "Night") return _contact[index];
  // }

  void addContact(Contact contact) async {
    var box = await Hive.openBox<Contact>(_boxName);

    await box.add(contact);

    _contact = box.values.toList();

    notifyListeners();
  }

  void deleteContact(key) async {
    var box = await Hive.openBox<Contact>(_boxName);

    await box.delete(key);

    _contact = box.values.toList();

    Log.i("Deleted member with key" + key.toString());

    notifyListeners();
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

  void editContact({Contact contact, int contactKey}) async {
    var box = await Hive.openBox<Contact>(_boxName);

    await box.put(contactKey, contact);

    _contact = box.values.toList();

    _activeContact = box.get(contactKey);

    Log.i("Edited " + contact.name);

    notifyListeners();
  }

  void setActiveContact(key) async {
    var box = await Hive.openBox<Contact>(_boxName);

    _activeContact = box.get(key);

    notifyListeners();
  }

  Contact getActiveContact() {
    return _activeContact;
  }

  int get contactCount {
    return _contact.length;
  }
}
