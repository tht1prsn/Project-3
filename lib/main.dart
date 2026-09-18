// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/add_a_person_widget.dart';
import 'package:project_3/widgets/delete_a_person_widget.dart';
import 'package:project_3/widgets/person_widget.dart';
import 'package:project_3/widgets/person_info_widget.dart';


class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final HashMap<String, Person> items = HashMap();

  TextEditingController searchController = TextEditingController();

  String searchCriteria = "";

  @override
  void initState()
  {
    super.initState();

    InfoCardWidget.handleListAdded = _handleNewItem;
    InfoCardWidget.handleDeleteItem = _handleDeleteItem;

    DeletePerson.handleDeleteItem = _handleDeleteItem;
  }


  void _handleDeleteItem(Person item) {
    setState(() {
      print("Deleting Entry");
      items.remove(item.name);
    });
  }
  void _handleNewItem(String personName, String comment, Color personColor, TextEditingController textController, TextEditingController commentsController){
    setState(() {
      print("Adding new item");
      Person newPerson = Person(name: personName, avatarColor: personColor, filters: null, comment: comment, connections: null);
      items[personName] = newPerson;
      textController.clear();
      commentsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peopol Knower'),
        ),
        body: 
          Column(
            children: [
              SizedBox(
                width: 300,
                child: 
                  SearchBar
                  (
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchCriteria = value;
                      });
                    },
                    trailing: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            searchCriteria="";
                            searchController.clear();
                          });
                        },
                        icon: const Icon(Icons.cancel))
                    ]
                  ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  children:  
                      items.values.where
                      ((item) => item.name.toLowerCase().contains(searchCriteria.toLowerCase())
                      ).toList().map((item) 
                      {
                        return PersonItem
                        (
                          item: item,
                        );
                      }).toList(),
                )
              )
            ],
          ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AddAPersonWidget(onListAdded: _handleNewItem);
                  });
            }));
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Peopl Knower',
    home: PersonList(),
  ));
}
