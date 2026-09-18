import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3/main.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/add_a_person_widget.dart';
import 'package:project_3/widgets/person_info_widget.dart';
import 'package:project_3/widgets/person_widget.dart';
import 'package:project_3/widgets/delete_a_person_widget.dart';

import 'dart:collection';

//test person widget if can hold data
//test if list can add items
//test if list has duplicates (should not have duplicates)
//test if search works correctly
//test if list can remove items
//test if list can edit existing

void main() {

  testWidgets('Person widget has person entry', (tester) async {
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
      )));
      final textFinder = find.text('person');
      expect(textFinder, findsOneWidget);

      });

      


    testWidgets('Person Widget has CircleAvatar with single letter', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PersonItem(item: Person(
            name: "person",
            avatarColor: Colors.black,
            comment: null,
            connections: null,
            filters: null
          ))
        )
      ));

      final abbvFinder = find.text('p');
      final avatarFinder = find.byType(CircleAvatar);
      CircleAvatar circ = tester.firstWidget(avatarFinder);
      Text ctext = circ.child as Text;

      expect(abbvFinder, findsOneWidget);
      expect(ctext.data, 'p');

    });

    


    testWidgets('Info Card shows correct info', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: 
          SizedBox(
            height: 600,
            width: 800,
            child: InfoCardWidget(item: Person(
              name: "bobert man",
              comment: "he is",
              filters: null,
              connections: null,
              avatarColor: Colors.blue
            ))
          )
        )
      ));
        await tester.pump();
        final nameFinder = find.text('bobert man');
        final commentFinder = find.text('he is');

        expect(nameFinder, findsOneWidget);
        expect(commentFinder, findsOneWidget);
    });


    PersonAddedCallback voidFunction=(value, comment, personColor, textConroller, commentsController) => expect(value.isNotEmpty, isTrue);
    testWidgets('Add Person only allows save when name not empty', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            height: 600,
            child : AddAPersonWidget(onListAdded: voidFunction)
          )
      )));

      final nameFieldFinder = find.byKey(Key("NameField"));
      final saveButtonFinder = find.byKey(Key('SaveButton'));

      await tester.pump();
      await tester.tap(saveButtonFinder);
      await tester.pump();
      await tester.enterText(nameFieldFinder, "hsdfh");
      await tester.pump();
      await tester.tap(saveButtonFinder);


    });


    int called_amounts = 0;
    DeletePerson.handleDeleteItem = (Person item) {
      expect(item, isNotNull);
      called_amounts++;
    };
    testWidgets('Delete Person is able to call function when held down', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DeletePerson(item: Person(
            name: "john",
            comment: null,
            avatarColor: Colors.black,
            connections: null,
            filters: null
          ))
        )
      ));
      final ConfirmButton = find.byKey(Key("ConfirmDelete"));

      await tester.pump();
      await tester.press(ConfirmButton);
      expect(called_amounts, 0);
      await tester.pump();
      await tester.longPress(ConfirmButton);
      expect(called_amounts, 1);




    });


}


      
  
      
