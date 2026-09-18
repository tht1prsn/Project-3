import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/person_info_widget.dart';
import 'package:project_3/widgets/delete_a_person_widget.dart';

class PersonItem extends StatelessWidget {
  PersonItem(
      {required this.item,})
      : super(key: ObjectKey(item));

  final Person item;

  TextStyle? _getTextStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/55050463/how-to-detect-swipe-in-flutter
    return 
      GestureDetector(
        onPanUpdate: (details) {
          if(details.delta.dx > 2) {
            showDialog(
                  context: context,
                  builder: (_)
                  {
                    return InfoCardWidget(item: item);
                  }
              );
          }
        },
        child: ListTile
        (
          onLongPress: () {
            showDialog(context: context, builder: (_)
            {
              return DeletePerson(item: item);
            });
          },
          leading: CircleAvatar(
            backgroundColor: item.avatarColor,
            child: Text(item.name.substring(0, 1)),
          ),
          title: Text(
            item.name,
            style: _getTextStyle(context),
          ),
        )
      );
  }
}