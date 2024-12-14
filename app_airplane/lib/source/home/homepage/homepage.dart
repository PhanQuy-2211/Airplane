import 'package:app_airplane/source/home/homepage/page/account.dart';
import 'package:app_airplane/source/home/homepage/page/booking.dart';
import 'package:app_airplane/source/home/homepage/page/home.dart';
import 'package:app_airplane/source/home/homepage/page/saved.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // final String title;
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _layoutPage = [
    Home(),
    Saved(),
    Booking(),
    Account(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[900],
        onTap: _onTabItem,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            label: 'My Booking',
          ),    
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
        ],
      ),
    );
  }
}
