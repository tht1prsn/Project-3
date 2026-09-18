import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/add_a_person_widget.dart';



class InfoCardWidget extends StatelessWidget
{
  Person item;
  InfoCardWidget({
    required this.item,
    super.key
  });
  bool updateInfo = false;

  static void Function(Person item)? handleDeleteItem;
  static void Function(String name, String comment, Color color, TextEditingController nameControl, TextEditingController commentControl)? handleListAdded;


  void replaceItem(String name, String comment, Color color, TextEditingController nameControl, TextEditingController commentControl)
  {
    if(item.name != name)
    {
      handleDeleteItem?.call(item);
    }
    handleListAdded?.call(name, comment, color, nameControl, commentControl);
    updateInfo = true;
  }

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
                  onPressed: () async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (_) {
                      return AddAPersonWidget(onListAdded: replaceItem, item: item);
                    });

                    if(result == true) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Edit"))
              )
            )
          ]
        ),
      content:
        Column(
          children: [
            Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(backgroundColor: item.avatarColor),
              SizedBox(width: 100, child: Text(item.name))
            ]),



            Text("Comments:"),
            SizedBox(
              width: 200,
              height: null,
              child:
                Text(
                  item.comment ?? "",
                  maxLines: null,
                  softWrap: true,
                ),
            )
            //comments (Always Last)
            
          ],
        )

    );
  }
  
}