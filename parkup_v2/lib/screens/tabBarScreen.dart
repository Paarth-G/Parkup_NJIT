import 'package:flutter/material.dart';
import 'package:parkup_v2/screens/parkingPass/viewPassesPage.dart';
import 'package:parkup_v2/screens/registeredCars/viewCarsPage.dart';
import 'profilePage.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int tabIndex = 0;
  List<Widget> listScreens;
  Color njitRed = const Color(0xffCD0200);

  @override
  void initState() {
    super.initState();
    listScreens = [
      ViewPassesPage(),
      ViewCarsPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: njitRed,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_parking),
              label: 'Passes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Cars Registered',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
