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
  final String color;
  @HiveField(4)
  final String maincolor;
  @HiveField(5)
  final String maed;

  Contact(
      {@required this.name,
      @required this.dose,
      @required this.time,
      this.color,
      this.maincolor,
      this.maed});
}
