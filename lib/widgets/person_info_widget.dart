import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/add_a_person_widget.dart';

typedef RemovePersonCallback = Function(Person item);

class InfoCardWidget extends StatelessWidget
{
  Person item;
  InfoCardWidget({
    required this.item,
    required this.onPersonRemove,
    super.key
  });

  final RemovePersonCallback onPersonRemove;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: 
        Row(
          children: 
          [ 
            const Align
            (
              alignment: Alignment.centerLeft,
              child: Text('Info Card')
            ),
            Padding
            (
              padding: const EdgeInsetsGeometry.directional(start: 34.0),
              child: Align
              (
                alignment: Alignment.centerRight,
                child: TextButton
                (
                  onPressed: () {
                    onPersonRemove(item);
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"))
              )
            )
          ]
        ),
      content:
        ListView(
          children: [
            Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(backgroundColor: item.avatarColor),
              SizedBox(width: 100, child: Text(item.name))
            ]),



            Expanded(
              child: Text(
                item.comment ?? "",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            )
            //comments (Always Last)
            
          ],
        )

    );
  }
  
}