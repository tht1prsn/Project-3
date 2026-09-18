import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/person_info_widget.dart';

class DeletePerson extends StatelessWidget {
  DeletePerson(
      {required this.item,})
      : super(key: ObjectKey(item));

  final Person item;

  static void Function(Person item)? handleDeleteItem;

  void DeleteItem(Person item)
  {
    handleDeleteItem?.call(item);
  }

  TextStyle? _getTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/55050463/how-to-detect-swipe-in-flutter
    return 
        AlertDialog(
          title: const Text('Delete entry'),
          content: 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
              ),
              onLongPress: () {
                DeleteItem(item);
                Navigator.pop(context);
              },
              onPressed: null,
              child: Text("Hold to Delete")
            )
        );
  }
}