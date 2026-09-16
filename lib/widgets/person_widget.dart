import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';

typedef PersonChangedCallback = Function(Person item);
typedef PersonRemovedCallback = Function(Person item);

class PersonItem extends StatelessWidget {
  PersonItem(
      {required this.item,
      required this.onListChanged,
      required this.onDeleteItem})
      : super(key: ObjectKey(item));

  final Person item;

  final PersonChangedCallback onListChanged;
  final PersonRemovedCallback onDeleteItem;

  TextStyle? _getTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      },
      onLongPress: () {

      },
      leading: CircleAvatar(
        backgroundColor: item.avatarColor,
        child: Text(item.name.substring(0, 1)),
      ),
      title: Text(
        item.name,
        style: _getTextStyle(context),
      ),
    );
  }
}