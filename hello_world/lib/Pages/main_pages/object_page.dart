//create a page for an object.dart that consists of two screens in two separate tabs; namely Expenses and Services
import 'package:flutter/material.dart';
import 'package:hello_world/Pages/add_from_pages/add_from_object_page.dart';
import 'package:hello_world/Pages/profile_pages/profile_page.dart';
import 'package:hello_world/screens/objects_screens/object_expense.dart';
import 'package:hello_world/screens/objects_screens/object_service.dart';

import '../add_from_pages/add_home_page_floating_button.dart';

class ObjectPage extends StatefulWidget {
  final String communityName;
  final String objectName;
  const ObjectPage({Key? key, required this.objectName, required this.communityName}) : super(key: key);

  @override
  State<ObjectPage> createState() => _ObjectPageState();
}

class _ObjectPageState extends State<ObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 30.0),
            onPressed: (){},
          ),
          title: Text(
            widget.objectName
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child:
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.person_2_outlined, size: 30,),
                )
            )
          ],
        ),
      body: DefaultTabController(
        length: 2,
        child: Builder(
          builder: (BuildContext tabContext) =>
            Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: AppBar(
                  bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.currency_rupee_outlined),),
                    Tab(icon: Icon(Icons.home_repair_service),),
                  ],
                  indicatorColor: Colors.white,
                ),
              ),
              ),
              body: TabBarView(
                children: [
                  ObjectExpenseScreen(objectName: widget.objectName,),
                  ObjectServiceScreen(objectName: widget.objectName,),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFromObjectPage(selectedPage: DefaultTabController.of(tabContext).index+1, communityName: widget.communityName, objectName: widget.objectName),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
        ),
      ),
    );
  }
}