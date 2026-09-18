import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3/main.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/person_widget.dart';
import 'dart:collection';

//test person widget if can hold data
//test if list can add items
//test if list has duplicates (should not have duplicates)
//test if search works correctly
//test if list can remove items
//test if list can edit existing

void main() {

  testWidgets('Person List has person entry', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PersonItem(item: Person(
          name: "person",
          avatarColor: Colors.black,
          comment: null,
          connections: null,
          filters: null
          )
        )
      )));});

      final textFinder = find.text('person');


      //testWidgets("Person List can hold entry", (tester) async {
      //  await tester.pumpWidget(MaterialApp(home: PersonList()));
      //  final state = tester.state(find.byType(PersonList));
      //
      //  
      //}))

      
  
      

}