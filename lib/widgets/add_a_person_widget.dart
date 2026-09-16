import 'package:flutter/material.dart';

typedef PersonAddedCallback = Function(
    String value, TextEditingController textConroller);

class AddAPersonWidget extends StatefulWidget {
  const AddAPersonWidget({
    super.key,
    required this.onListAdded,
  });

  final PersonAddedCallback onListAdded;

  @override
  State<AddAPersonWidget> createState() => _AddAPersonState();
}

class _AddAPersonState extends State<AddAPersonWidget> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.grey);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.black);

  String valueText = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Information'),
      content: 
        ListView(
          //circle avatar to hold person photo
          //text field to add name
          // button to add custom tags
          // chips to select custom tags
          // section for additional comments
          children: [
            

            Expanded(child:
              TextField(
                onChanged: (value) {
                  setState(() {
                  valueText = value;
                  });
                },
                controller: _inputController,
                decoration: const InputDecoration(hintText: "name"),
              )
            )
          ],
        ),
      actions: <Widget>[
        // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _inputController,
          builder: (context, value, child) {
            return ElevatedButton(
              key: const Key("SaveButton"),
              style: yesStyle,
              onPressed: value.text.isNotEmpty
                  ? () {
                      setState(() {
                        Navigator.pop(context);
                        //name, photo, extra, comment
                        widget.onListAdded(valueText, _inputController);
                      });
                    }
                  : null,
              child: const Text('Save'),
            );
          },
        ),
      ],
    );
  }
}
