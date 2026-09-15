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

    Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return Theme.of(context).primaryColor;
  }

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
        backgroundColor: _getColor(context),
        child: Text(item.name),
      ),
      title: Text(
        item.name,
        style: _getTextStyle(context),
      ),
    );
  }
}