import 'package:app_airplane/source/home/homepage/homepage.dart';
import 'package:app_airplane/source/home/login.dart';
import 'package:app_airplane/source/home/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_airplane/source/firebase/firebase_options.dart';
import 'package:app_airplane/source/firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel",
      home: HomePage(),
      routes: {
       // '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => MyHomePage(),
      },
    )
  );
  
}