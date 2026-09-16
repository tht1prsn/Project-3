import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';

class InfoCardWidget extends StatelessWidget
{
  Person item;
  InfoCardWidget({
    required this.item,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Info Card'),
      content:
        ListView(
          children: [
            Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(backgroundColor: item.avatarColor),
              SizedBox(width: 100, child: Text(item.name))
            ])
          ],
        )

    );
  }
  
}