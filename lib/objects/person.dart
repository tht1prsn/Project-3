

import 'dart:collection';
import 'package:flutter/material.dart';

class Person {
  Person({required this.name, required this.photo, required this.comment, required this.additionalData});

  String name;
  Image? photo;
  String? comment;
  HashMap<String, String>? additionalData;
}