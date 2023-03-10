import 'package:flutter/material.dart';
import 'package:hello_world/Pages/object_page.dart';

import '../Pages/add_home_page_floating_button.dart';
import 'community.dart';

class Object extends StatefulWidget {
  final String name;
  const Object({Key? key, required this.name}) : super(key: key);

  @override
  State<Object> createState() => _ObjectState();
}

class _ObjectState extends State<Object> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ObjectPage()
            )
        );
      },
      child: Container(
        width: 150,
        height: 100,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 5  horizontally
                1.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  PopupMenuButton<Choice>(
                    itemBuilder: (BuildContext context) {
                      return choices.skip(0).map((Choice choice) {
                        return PopupMenuItem <Choice>(
                          value: choice,
                          child: Text(choice.name),
                        );
                      }).toList();
                    },
                  ),
                ]
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 25.0,
                width: 25.0,
                child: FloatingActionButton(
                  heroTag: "Comm_Btn",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddExpenseServiceCommunity()),
                    );
                  },
                  child: const  Text(
                      "+"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


const List<Choice> choices = <Choice> [
  Choice(name: 'Add Expense'),
  Choice(name: 'Add Service')
];