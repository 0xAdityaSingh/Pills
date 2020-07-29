import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String dose;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final Color color;

  Contact(
      {@required this.name,
      @required this.dose,
      @required this.time,
      this.color});
}
