// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:project_3/objects/person.dart';
import 'package:project_3/widgets/add_a_person_widget.dart';
import 'package:project_3/widgets/person_widget.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final List<Person> items = [];
  final _itemSet = <Person>{};

  TextEditingController searchController = TextEditingController();

  String searchCriteria = "";


  void _handleListChanged(Person item) {
    setState(() {
    });
  }
  void _handleDeleteItem(Person item) {
    setState(() {
      print("Deleting Entry");
      items.remove(item);
    });
  }
  void _handleNewItem(String personName, Color personColor, TextEditingController textController) {
    setState(() {
      print("Adding new item");
      Person newPerson = Person(name: personName, avatarColor: personColor, filters: null, comment: null, connections: null);
      items.insert(0, newPerson);
      textController.clear();
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
                    items.where(
                      (item) => item.name.toLowerCase().contains(searchCriteria)
                    ).toList().map((item) {
                    return PersonItem(
                      item: item,
                      onListChanged: _handleListChanged,
                      onDeleteItem: _handleDeleteItem,
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
