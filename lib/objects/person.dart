import 'dart:collection';
import 'package:flutter/material.dart';

class Person {
  Person({required this.name, required this.avatarColor, required this.comment, required this.filters, required this.connections});

  String name;
  Color avatarColor;
  String? comment;
  List<Person>? connections;
  HashSet<String>? filters;
}