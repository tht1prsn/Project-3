import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';

typedef PersonAddedCallback = Function(
    String value, String comment, Color personColor, TextEditingController textConroller, TextEditingController commentsController);

class AddAPersonWidget extends StatefulWidget {
  AddAPersonWidget({
    super.key,
    required this.onListAdded,
     this.item,
  });


  final Person? item;
  final PersonAddedCallback onListAdded;

  @override
  State<AddAPersonWidget> createState() => _AddAPersonState();
}

class _AddAPersonState extends State<AddAPersonWidget> {

  



  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  TextEditingController _inputController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();


  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.grey);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.black);

  final List<Color> pastelColors = [
  //https://colorhunt.co/palettes/pastel
  const Color(0xFFFFB3BA), // Pastel Pink
  const Color(0xFFFFDFBA), // Pastel Peach
  const Color(0xFFFFFFBA), // Pastel Yellow
  const Color(0xFFBAFFC9), // Pastel Green
  const Color(0xFFBAE1FF), // Pastel Blue
  const Color(0xFFD7BAFF), // Pastel Purple
  const Color(0xFFFFBAE8), // Pastel Magenta
  const Color(0xFFBAFFF5), // Pastel Cyan
  const Color(0xFFE8BAFF), // Pastel Lavender
  const Color(0xFFCFF5E7), // Pastel Mint
  const Color(0xFFFFD6A5), // Light Orange
  const Color(0xFFDDEBF7), // Light Sky
  ];
  int colorIndex = 0;

  String valueText = "";
  String commentText = "";
  @override
  void initState()
  {
    super.initState();

    if(widget.item != null)
    {
      _inputController = TextEditingController(text: widget.item?.name);
      _commentsController = TextEditingController(text: widget.item?.comment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Information'),
      content: 
        ListView(
          //circle avatar to hold person photo
          //text field to add name
          // chips to select custom tags
            // button to add custom tags
          // chips to select people connnections from current list
          // section for additional comments
          children: [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                IconButton.filled(
                  onPressed: () {
                    setState(() {
                      colorIndex -= 1;
                      if(colorIndex < 0)
                      {
                        colorIndex = pastelColors.length-1;
                      }
                    });
                  },
                  icon: const Icon(Icons.arrow_left)
                ),
                CircleAvatar(
                  backgroundColor: pastelColors[colorIndex],
                ),
                IconButton.filled(
                  onPressed: () {
                    setState(() {
                      colorIndex += 1;
                      if(colorIndex > pastelColors.length) {
                        colorIndex = 0;
                      }
                    });
                  },
                  icon: const Icon(Icons.arrow_right)
                )
              ],
            ),
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
            ),


            //comments text field
            Expanded(
              child: TextField(
                controller: _commentsController,
                onChanged: (value) {
                  setState(() {
                    commentText = value;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: "Comments for contact"
                ),
              ),
            )
            //https://stackoverflow.com/questions/45900387/multi-line-textfield-in-flutter
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

                        //name, photo, extra, comment
                        widget.onListAdded(valueText, commentText, pastelColors[colorIndex], _inputController, _commentsController);
                        Navigator.pop(context, true);
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
