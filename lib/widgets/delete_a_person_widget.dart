import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/person_info_widget.dart';

typedef PersonRemovedCallback = Function(Person item);

class DeletePerson extends StatelessWidget {
  DeletePerson(
      {required this.item,
      required this.onDeleteItem})
      : super(key: ObjectKey(item));

  final Person item;

  final PersonRemovedCallback onDeleteItem;

  TextStyle? _getTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/55050463/how-to-detect-swipe-in-flutter
    return 
        AlertDialog();
  }
}