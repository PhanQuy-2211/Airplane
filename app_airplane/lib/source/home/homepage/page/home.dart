import 'package:app_airplane/source/firebase/fire_auth.dart';
import 'package:flutter/material.dart';
import '../components/cardAccount.dart';
import '../components/mainMenu.dart';
import '../components/promotion.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
  String? fetchedUsername = await FirebaseAuthService().fetchUsername();
  setState(() {
    username = fetchedUsername;
  });
  }
  @override
  Widget build(BuildContext context) {
    /*final User? user = FirebaseAuth.instance.currentUser;
    final String username = user?.displayName ?? 'Unknown User';*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapel'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          CardAccount(username:  username ?? 'Loading...'),
          Divider(),
          MainMenu(),
          Promotion()
        ],
      )
    );
  }
}