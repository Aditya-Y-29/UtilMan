import 'package:flutter/material.dart';
import 'package:hello_world/Notifications/notification_services.dart';
import 'package:hello_world/Pages/main_pages/community_page.dart';
import 'package:hello_world/Pages/profile_pages/profile_page.dart';
import 'package:provider/provider.dart';
import '../../components/community.dart';
import '../add_from_pages/add_home_page_floating_button.dart';
import '../../provider/data_provider.dart';
import 'package:hello_world/Pages/main_pages/navigation_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int clickedCommunity = 0;
  String communityName = "";

  NotificationServices notificationServices = NotificationServices();
  
  @override
  void initState() {
    super.initState();
    notificationServices.RequestNotificationPermission();
    notificationServices.initlocalNotifications();
    notificationServices.firebaseInit();
    notificationServices.isTokenRefreshed();
    
    DataProvider tokenProvider =Provider.of<DataProvider>(context, listen: false);
    tokenProvider.addToken();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationPage()),
            );
          }
        ),
        title: const Text("Your Communities"),
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
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 30,
                  height: 30,
                  errorBuilder: ( context,  exception,  stackTrace) {
                    return Image.asset(
                      'assets/img1.png',
                      width: 30,
                      height: 30,
                    );
                  },
                ),
              )
          )
        ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, communityDataProvider, child) {
          return Container(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container (
                        height: 100,
                        width: 300,
                        margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                          color: Colors.green.shade50,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: FloatingActionButton(
                                      heroTag: "BTN-9",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddFromHomePage(selectedPage: 0),
                                          ),
                                        );
                                      },
                                      backgroundColor: Colors.green,
                                      child: const Icon(Icons.add_home_work),
                                    ),
                                  ),
                                  const Text(
                                    "Community",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: FloatingActionButton(
                                        heroTag: "BTN-10",
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddFromHomePage(selectedPage: 1),
                                            ),
                                          );
                                        },
                                        backgroundColor: Colors.green,
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          child:  Row(
                                            children: const [
                                              Text("+"),
                                              Icon(Icons.grid_view),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  const Text(
                                    "Add Object",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: FloatingActionButton(
                                        heroTag: "BTN-11",
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddFromHomePage(selectedPage: 2),
                                            ),
                                          );
                                        },
                                        backgroundColor: Colors.green,
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          child:  Row(
                                            children: const [
                                              Text("+"),
                                              Icon(Icons.currency_rupee_outlined),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  const Text(
                                    "Add Expense",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                        child:
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                // clickedCommunity = 0;
                                communityName = "";
                              });
                            },
                          ),
                      ),
                      Container(
                        height: 420,
                        child:
                        ListView(
                          physics: AlwaysScrollableScrollPhysics(),
                            // spacing: 8,
                            // runSpacing: 1,
                            children: List.of(communityDataProvider.communities.map((e) {
                              if(!e.toLowerCase().contains(searchController.text.toLowerCase().trim())) {
                                return SizedBox(height: 0,);
                              }
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {

                                      communityName = e;
                                    });
                                    Navigator.of(context).push(_createRoute(communityName));

                                  },
                                  child: AnimatedContainer(
                                    width: 340,
                                    height: 100,
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                                    padding: const EdgeInsets.only(top: 25.0, bottom: 5.0, left: 10.0, right: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    child: Community(
                                      name: e,
                                    ),
                                  )
                              );
                            })
                          )
                        ),
                      )
                    ],
                  )
              )
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green.shade50,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(width: 16.0,height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,bottom: 8,top: 4),
              child: FloatingActionButton(
                heroTag: "BTN-12",
                onPressed: () async {
                  DataProvider dataProvider =
                  Provider.of<DataProvider>(context, listen: false);
                  const snackbar1 = SnackBar(content: Text("Refreshing..."), duration: Duration(seconds: 4),);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar1);
                  await dataProvider.getAllDetails(dataProvider.user!.phoneNo);
                },
                child: Icon(Icons.sync),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Route _createRoute(String communityName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        CommunityPage(communityName: communityName),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}