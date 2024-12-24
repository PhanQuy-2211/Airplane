import 'package:app_airplane/source/firebase/fire_auth.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search.dart';
import 'home.dart';
import 'account.dart';
import 'package:app_airplane/source/theme/provider_theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  String? username;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loademail();
  }

  Future<void> _loadUsername() async {
    try {
      String? fetchedUsername = await FirebaseAuthService().fetchUsername();
      setState(() {
        username = fetchedUsername;
      });
    } catch (e) {
      setState(() {
        username = "Error";
      });
    }
  }

  Future<void> _loademail() async {
    try {
      String? fetchedUsername = await FirebaseAuthService().fetchemail();
      setState(() {
        email = fetchedUsername;
      });
    } catch (e) {
      setState(() {
        email = "Error";
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Tạo danh sách các màn hình với username
    final List<Widget> _widgetOptions = [
      Home(username: username ?? 'Loading...'),
      Search(),
      Account(username: username ?? 'Loading...',email: email ?? 'Loading...'),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: themeProvider.themeData == Styles.darkTheme
            ? Colors.white
            : Colors.blue, // Màu khi được chọn
        unselectedItemColor: themeProvider.themeData == Styles.darkTheme
            ? Colors.grey
            : Colors.blueGrey, // Màu khi không được chọn
        backgroundColor: themeProvider.themeData == Styles.darkTheme
            ? Colors.black
            : Colors.white, // Màu nền của BottomNavigationBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle, size: 30),
            label: 'My Account',
          ),
        ],
      ),
    );
  }
}
