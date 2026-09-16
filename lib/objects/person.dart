

import 'dart:collection';
import 'package:flutter/material.dart';

class Person {
  Person({required this.name, required this.photo, required this.comment, required this.filters, required this.connections});

  String name;
  Image? photo;
  String? comment;
  List<Person>? connections;
  HashSet<String>? filters;
}