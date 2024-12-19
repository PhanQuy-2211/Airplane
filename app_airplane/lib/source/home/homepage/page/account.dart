import 'package:app_airplane/source/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
          )
        ],
      ),
      body: Stack(
        children:[ 
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black26),
            ),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () async {
              // Đăng xuất Firebase
                await FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
              },
              color: Colors.greenAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Log out",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}